extends MovementBehaviour
class_name FollowPlayerMovement

@onready var base_node:Node2D = $".."
@onready var forward_node :Node2D = $"../Forward"

@export var shipstats:ShipStats = preload("res://game/entities/units/enemies/pirate_ship/pirate_ship_stats.tres")

func get_movement() -> Vector2:
	if not Global.player:return Vector2.ZERO
	var player_pos =  Global.player.global_position
	var direction = (player_pos - base_node.global_position).normalized()
	var velocity = direction*shipstats.forward_speed
	return velocity * get_physics_process_delta_time()

func get_rotation() -> float:
	if not Global.player:return 0.0
	var player_pos =  Global.player.global_position
	var player_direction = (player_pos - base_node.global_position).normalized()
	var forward_direction = (forward_node.global_position - base_node.global_position).normalized()
	
	var angle_to_player = forward_direction.angle_to(player_direction)
	return angle_to_player
