extends Ship
class_name PlayerShip

@onready var _pickup_collider = $PickupRadius/CollisionShape2D

func _ready() -> void:
	super()
	# we really want this to be in init, but we shall do this when we have an entity spawner
	stats = stats as PlayerShipStats
	# this should actually be done at the start of the run, not when we spawn
	RunData.init_stats_from_player(stats)
	SignalBus.PlayerShipPickupRadiusChanged.emit(RunData.get_stat("pickup_range"))
	
func _on_pickup_radius_area_entered(area: Area2D) -> void:
	# pull collectable towards player
	pass # Replace with function body.

func _on_pickup_radius_body_entered(body: Node2D) -> void:
	# pull collectable towards player
	pass # Replace with function body.
