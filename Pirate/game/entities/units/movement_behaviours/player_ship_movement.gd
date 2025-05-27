extends MovementBehaviour
class_name PlayerShipMovement 

@onready var forward_node :Node2D = $"../Forward"
@onready var base_node : Node2D = $".."

var last_movement = Vector2.ZERO
# TODO: these stats should be accessed from a Run singleton 
var ship_stats : PlayerShipStats = preload("res://game/data/stats/ships/fallback_player_ship_stats.tres")

func get_movement() -> Vector2:
	var movement: Vector2 = Vector2.ZERO
	var moveDirection = (forward_node.global_position - base_node.global_position).normalized()
	var velocity = moveDirection * ship_stats.forward_speed
	return velocity * get_physics_process_delta_time()

func get_rotation() -> float:
	var turnAmount = Input.get_axis("TurnLeft", "TurnRight")
	var turnRad = deg_to_rad(turnAmount * ship_stats.turning_speed * get_physics_process_delta_time())
	return turnRad
