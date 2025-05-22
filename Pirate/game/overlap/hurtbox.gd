extends Area2D
class_name Hurtbox

@onready var _collision = $CollisionShape2D

func is_disabled() -> bool:
	return _collision.disabled
	
func enable() -> void:
	_collision.set_deferred("disabled", false)
	
func disable() -> void:
	_collision.set_deferred("disabled", true)
