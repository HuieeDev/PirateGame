extends LiveUnitStats
class_name LiveShipStats

var forward_speed : float
var turning_speed : float

# due to inheritance of the func this is coded as LiveUnitStats,
# but LiveShipStats should be passed in
func copy (live_stats :  LiveUnitStats) -> void:
	super.copy(live_stats)
	if live_stats is not LiveShipStats:
		push_error("Non LiveShipStats stats passed in!")
		return
	
	var live_ship_stats = live_stats as LiveShipStats
	forward_speed = live_stats.forward_speed
	turning_speed = live_stats.turning_speed

func copy_stats(stats : UnitStats) -> void:
	super.copy_stats(stats)
	if stats is not ShipStats:
		push_error("Non ShipStats stats passed in!")
		return
		
	var ship_stats = stats as ShipStats
	forward_speed = stats.forward_speed
	turning_speed = stats.turning_speed
