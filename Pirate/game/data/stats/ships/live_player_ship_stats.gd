extends LiveShipStats
class_name LivePlayerShipStats

var pickup_range : float

func copy(live_stats : LiveUnitStats) ->void:
	super.copy(live_stats)
	if live_stats is not LivePlayerShipStats:
		push_error("Non LivePlayerShipStats stats passed in!")
		return
	
	var live_ship_stats = live_stats as LivePlayerShipStats
	pickup_range = live_ship_stats.pickup_range

func copy_stats(stats : UnitStats) -> void:
	super.copy_stats(stats)
	if stats is not PlayerShipStats:
		push_error("Non PlayerShipStats passed in!")
		return
	
	var player_ship_stats = stats  as PlayerShipStats
	pickup_range = player_ship_stats.pickup_range
