extends Node2D
class_name Projectile

signal hit_something(thing_hit, damage_dealt)
signal available

@export var _destroy_on_leaving_screen := true

var velocity : Vector2
var spawn_position : Vector2
var max_range : float
var weapon_stats : RangedShipWeaponStats

var _to_be_destroyed := false
var _to_be_recycled := false
var _recycled := false

@onready var _hitbox := $Hitbox
@onready var _sprite := $Sprite2D
@onready var _destroy_timer := $DestroyTimer

func _ready() -> void:
	_hitbox.on_something_hit.connect(_on_hitbox_hit_something)

func _physics_process(delta: float) -> void:
	position += velocity * delta
	
	if (global_position - spawn_position).length() > weapon_stats.max_range:
		set_to_be_destroyed()


func get_damage() -> int:
	return _hitbox.damage


func set_damage(dmg : int, crit_chance := 0.0, crit_damage := 0.0) -> void:
	if not _hitbox: return
	
	if not is_instance_valid(_hitbox): return
	
	_hitbox.set_damage(dmg)


func _on_hitbox_hit_something(thing_hit : Node, damage : int) -> void:
	_hitbox.ignored_objects = [thing_hit]
	
	if weapon_stats.piercing <= 0:
		set_to_be_destroyed()
	else:
		weapon_stats.piercing -= 1
		if _hitbox.damage > 0:
			# TODO: proper reduction in damage for each pierce here
			_hitbox.damage = max(1, _hitbox.damage / 2)


func _on_destroy_timer_timeout() -> void:
	if _to_be_recycled:
		_on_to_be_recycled()
	else:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if not _to_be_destroyed and _destroy_timer.is_inside_tree() and _destroy_on_leaving_screen:
		_destroy_timer.start()


func set_to_be_destroyed() -> void:
	if _to_be_recycled:
		_on_to_be_recycled()
	else:
		_to_be_destroyed = true
		_hitbox.disable()
		queue_free()


func _on_to_be_recycled() -> void:
	if _recycled == false:
			_recycled = true
			_to_be_destroyed = true
			available.emit()


func set_ignored_objects(objects : Array) -> void:
	_hitbox.ignored_objects = objects


func set_from(from_node : Node) -> void:
	if _hitbox != null and is_instance_valid(_hitbox):
		_hitbox.from = from_node


func disable_hitbox()->void :
	_hitbox.disable()


func enable_hitbox()->void :
	_hitbox.enable()


func set_hitbox_collision_data(collision : int, mask: int) ->void:
	if not _hitbox == null: 
		_hitbox.set_collision_data(collision, mask)
	else:
		ready.connect(set_hitbox_collision_data.bind(collision, mask))


# if the entity that created this entity is killed, remove it. 
# maybe don't want this functionality
func on_entity_died(_entity:Entity)->void :
	set_to_be_destroyed()
