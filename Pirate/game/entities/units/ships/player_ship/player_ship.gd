extends Ship
class_name PlayerShip

@onready var _pickup_collider = $PickupRadius/CollisionShape2D

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, p_player_ref:Node2D = null, _entity_spawner_ref = null) -> void:
	stats = stats as PlayerShipStats
	
	SignalBus.PlayerShipPickupRadiusChanged.emit(Utils.get_stat("stat_pickup_range"))
	
	super(zone_min_pos, zone_max_pos, _entity_spawner_ref)


func _on_pickup_radius_area_entered(area: Area2D) -> void:
	# pull collectable towards player
	pass # Replace with function body.


func _on_pickup_radius_body_entered(body: Node2D) -> void:
	# pull collectable towards player
	pass # Replace with function body.


func get_entity_type() -> int:
	return EntityType.PLAYER
