extends Entity
class_name Unit

signal speed_changed
signal health_updated(current_health, max_health)
signal took_damage(unit, value)

@export var stats : UnitStats = preload("res://game/data/stats/fallback_unit_stats.tres")
var _current_stats : LiveUnitStats = LiveUnitStats.new()
var _starting_stats : LiveUnitStats = LiveUnitStats.new()

@onready var _hurtbox := $Hurtbox

var _current_movement_behaviour : MovementBehaviour
@onready var movement_behaviour : MovementBehaviour = $MovementBehaviour

@onready var _weapons_container : UnitWeaponsContainer = %WeaponsContainer
@export var _starting_weapons : Array[ShipWeaponData]

var _can_move:bool = true
var _current_movement:Vector2
var _current_rotation : float

var _can_attack : bool = true


func init(zone_min_pos:Vector2, zone_max_pos:Vector2, entity_spawner_ref = null) -> void:
	
	_current_movement_behaviour = movement_behaviour
	
	
	init_current_stats()
	
	_setup_weapons()
	
	_hurtbox.area_entered.connect(_on_hurtbox_entered)
	
	super(zone_min_pos, zone_max_pos, entity_spawner_ref)


func _on_hurtbox_entered(hitbox : Area2D) -> void:
	if not hitbox is Hitbox or hitbox.ignored_objects.has(self): return
	
	hitbox = hitbox as Hitbox
	
	var dmg = hitbox.damage
	var dmg_taken = [0,0]
	
	dmg_taken = take_damage(dmg, hitbox)
	#do projectile burning, make new projectiles etc logic here
	
	on_hurt()
	
	hitbox.hit_something(self, dmg_taken[1])


func _setup_weapons() -> void:
	_weapons_container.init(_starting_weapons, self, get_entity_type())


func init_current_stats()-> void:
	_current_stats.copy_stats(stats)
	_starting_stats.copy(_current_stats)


func _physics_process(delta: float) -> void:
	_current_movement = get_movement() if _can_move else Vector2.ZERO
	global_position += _current_movement
	_current_rotation = get_mov_rotation()
	rotate(_current_rotation)


func _process(delta: float) -> void:
	if _can_attack:
		_weapons_container.update_weapons(delta)


func get_movement() -> Vector2:
	return _current_movement_behaviour.get_movement() if _can_move else _current_movement


func get_mov_rotation() -> float:
	return _current_movement_behaviour.get_rotation()


func take_damage(amount : int, hitbox : Hitbox = null) -> Array:
	
	var dmg_dealt = 0
	var full_dmg_value = amount #actually want this to be affected by armour if the shot isn't piercing
	
	_current_stats.health = max(0, _current_stats.health - amount)
	took_damage.emit(self, amount)
	
	dmg_dealt = clamp(full_dmg_value, 0, _current_stats.health)
	
	if _current_stats.health == 0:
		if hitbox:
			hitbox.killed_something(self)
		die()
	else:
		health_updated.emit(_current_stats.health, _starting_stats.health)
	
	return [full_dmg_value, dmg_dealt]


func on_hurt() -> void:
	pass
