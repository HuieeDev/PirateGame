class_name LiveUnitStats

# the variables here should match UnitStats
var health : int

func copy(live_stats : LiveUnitStats) ->void:
	health = live_stats.health

func copy_stats(stats : UnitStats) -> void:
	health = stats.health
