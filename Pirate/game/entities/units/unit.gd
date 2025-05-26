extends Entity
class_name Unit

signal speed_changed
signal health_updated(current_health, max_health)
signal took_damage(unit, value)

var _current_movement_behaviour : MovementBehaviour
@onready var movement_behaviour : MovementBehaviour = $MovementBehaviour

var _can_move:bool = true
var _current_movement:Vector2
var _current_rotation : float

func _ready() -> void:
	_current_movement_behaviour = movement_behaviour
	
func _physics_process(delta: float) -> void:
	_current_movement = get_movement() if _can_move else Vector2.ZERO
	global_position += _current_movement
	_current_rotation = get_mov_rotation()
	rotate(_current_rotation)

func get_movement() -> Vector2:
	return _current_movement_behaviour.get_movement() if _can_move else _current_movement

func get_mov_rotation() -> float:
	return _current_movement_behaviour.get_rotation()
