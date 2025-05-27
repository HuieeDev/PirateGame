extends Entity
class_name Unit

signal speed_changed
signal health_updated(current_health, max_health)
signal took_damage(unit, value)

@export var stats : UnitStats = preload("res://game/data/stats/fallback_unit_stats.tres")
var _current_stats : LiveUnitStats = LiveUnitStats.new()
var _starting_stats : LiveUnitStats = LiveUnitStats.new()

var _current_movement_behaviour : MovementBehaviour
@onready var movement_behaviour : MovementBehaviour = $MovementBehaviour

var _can_move:bool = true
var _current_movement:Vector2
var _current_rotation : float

var _player_ref : Node2D

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, p_player_ref:Node2D = null, _entity_spawner_ref = null) -> void:
	
	_current_movement_behaviour = movement_behaviour
	
	_player_ref = p_player_ref
	
	init_current_stats()
	
	super(zone_min_pos, zone_max_pos)

# TODO: remove this once entity spawning is done correctly
func _ready() -> void:
	_current_movement_behaviour = movement_behaviour

func init_current_stats()-> void:
	_current_stats.copy_stats(stats)
	_starting_stats.copy(_current_stats)

func _physics_process(delta: float) -> void:
	_current_movement = get_movement() if _can_move else Vector2.ZERO
	global_position += _current_movement
	_current_rotation = get_mov_rotation()
	rotate(_current_rotation)

func get_movement() -> Vector2:
	return _current_movement_behaviour.get_movement() if _can_move else _current_movement

func get_mov_rotation() -> float:
	return _current_movement_behaviour.get_rotation()
