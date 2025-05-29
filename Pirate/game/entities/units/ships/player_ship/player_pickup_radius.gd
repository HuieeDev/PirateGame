extends Area2D
class_name PlayerPickupArea

const BASE_RADIUS = 100 #the default radius
const MIN_RADIUS = 30 # absolute smallest the radius can be

func _ready() -> void:
	_update_pickup_radius(BASE_RADIUS) 
	#BASE_RADIUS * (1.0 + (RunData.effects["pickup_range"] / 100.0)

func on_pickup_range_changed(new_pickup_range : float) -> void:
	var radius = BASE_RADIUS * (1.0 + (new_pickup_range / 100.0))
	_update_pickup_radius(radius)
	
func _update_pickup_radius(new_radius : float) -> void:
	$CollisionShape2D.shape.radius = max(MIN_RADIUS, new_radius)
