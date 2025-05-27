extends Ship
class_name PlayerShip

@onready var _pickup_collider = $PickupRadius/CollisionShape2D

func _ready() -> void:
	super()
	# we really want this to be in init, but we shall do this when we have an entity spawner
	stats = stats as PlayerShipStats
	update_pickup_radius(stats.pickup_range)
	
	Signalbus.PlayerShipPickupRadiusChanged.connect(update_pickup_radius)

func update_pickup_radius(new_radius : float) -> void:
	_pickup_collider.shape.radius = new_radius
	
func _on_pickup_radius_area_entered(area: Area2D) -> void:
	# pull collectable towards player
	pass # Replace with function body.

func _on_pickup_radius_body_entered(body: Node2D) -> void:
	# pull collectable towards player
	pass # Replace with function body.
