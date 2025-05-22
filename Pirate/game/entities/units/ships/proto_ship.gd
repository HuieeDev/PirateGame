extends CharacterBody2D

@onready var forwardNode : Node2D = $Forward
@export var f_speed = 40.0
@export var t_speed = 3.0

func _process(delta: float) -> void:
	var move_direction = (forwardNode.global_position - global_position).normalized()
	velocity = move_direction * f_speed
	move_and_slide()
	
	var turn_amount = Input.get_axis("TurnLeft", "TurnRight")
	var turn_rad = deg_to_rad(turn_amount * t_speed * delta)
	rotate(turn_rad)
