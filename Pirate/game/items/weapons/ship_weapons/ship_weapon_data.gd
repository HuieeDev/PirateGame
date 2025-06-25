extends ItemData
class_name ShipWeaponData

# Brotato had a weapon id on top of the id in itemparentdata. not sure why
#@export var weapon_id = "unset"
@export var type := Utils.ShipWeaponTypes.CANNON

# this is for upgrades i think? No pathing with this implementation
# @export var sets : Array[Resource]
@export var upgrades_into : ShipWeaponData = null

# if we want to display the weapons on the ship
@export var scene : PackedScene = null

@export var stats : ShipWeaponStats = null

var _dmg_dealt_last_wave := 0
# if we want to track num enemies killed or sth similar
var _tracked_value := 0

func get_category() -> int:
	return Utils.ItemCategory.WEAPON

func get_weapon_stats_text() -> String:
	var text = ""
	
	# get the current stats for the weapon from a WeaponService
	# from that get the text
	# var current_stats
	
	match(type):
		Utils.ShipWeaponTypes.CANNON:
			# current_stats = WeaponService.init_cannon_stats(params)
			pass
		Utils.ShipWeaponTypes.PROW:
			pass
		Utils.ShipWeaponTypes.FOLLOWER:
			pass
		Utils.ShipWeaponTypes.MISC:
			pass
	#return current_stats.get_text(params)
	return text
