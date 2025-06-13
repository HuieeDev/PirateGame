extends Resource
class_name ShipWeaponStats

@export var attack_speed : float = 1.0 # attack after x many seconds
@export var damage : int = 1
@export_range(0.0, 1.0, 0.05) var accuracy : float = 1.0
@export_range(0.0, 1.0, 0.01) var crit_chance : float = 0.01
@export var crit_mult : float = 1.5
@export_range(0, 10000, 10) var min_range : int = 0
@export_range(0, 10000, 10) var max_range : int = 150
@export_range(0, 1000, 1) var knockback : int = 0
@export var is_healing = false # set to true if weapon heals the player

func get_text() -> String:
	var text = "ShipWeaponStats.get_text() not implemented"
	return text
