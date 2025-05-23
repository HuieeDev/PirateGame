extends CharacterBody2D

@onready var forwardNode : Node2D = $Forward
@export var ship_stats : ShipStats = preload("res://game/data/ships/fallback_ship_stats.tres")

func _process(delta: float) -> void:
	var move_direction = (forwardNode.global_position - global_position).normalized()
	velocity = move_direction * ship_stats.forward_speed
	move_and_slide()
	
	var turn_amount = Input.get_axis("TurnLeft", "TurnRight")
	var turn_rad = deg_to_rad(turn_amount * ship_stats.turning_speed * delta)
	rotate(turn_rad)
