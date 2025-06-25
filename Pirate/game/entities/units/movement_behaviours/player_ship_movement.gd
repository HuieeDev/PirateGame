extends MovementBehaviour
class_name PlayerShipMovement 

@onready var forward_node :Node2D = $"../Forward"
@onready var base_node : Node2D = $".."

var last_movement = Vector2.ZERO

func get_movement() -> Vector2:
	var movement: Vector2 = Vector2.ZERO
	var moveDirection = (forward_node.global_position - base_node.global_position).normalized()
	var velocity = moveDirection * Utils.get_stat("stat_forward_speed")
	return velocity * get_physics_process_delta_time()


func get_rotation() -> float:
	var turnAmount = Input.get_axis("TurnLeft", "TurnRight")
	var turnRad = deg_to_rad(turnAmount * Utils.get_stat("stat_turn_speed") * get_physics_process_delta_time())
	return turnRad
