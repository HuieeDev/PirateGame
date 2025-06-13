extends Area2D
class_name Projectile

@export var speed := 100.0
var _velocity : Vector2

var _dmg : int = 1

func init(direction : Vector2) -> void:
	_velocity = speed * direction


func _process(delta: float) -> void:
	global_position += _velocity * delta


func _on_hit(other) -> void:
	if other is Unit:
		other.take_damage(_dmg)
