extends Node2D
class_name UnitWeaponsContainer

@onready var _followers_container := $Followers

func init(starting_weapons : Array[ShipWeaponData]) -> void:
	for weapon in starting_weapons:
		add_weapon(weapon)


func add_weapon(weapon_data : ShipWeaponData, slot = null) -> void:
	var weapon = weapon_data.scene.instantiate()
	
	#weapon.init(weapon_data)
	
	if weapon_data.type ==  Utils.ShipWeaponTypes.CANNON:
		_add_cannon(weapon, weapon_data)
	elif weapon_data.type == Utils.ShipWeaponTypes.FOLLOWER:
		_add_follower(weapon, weapon_data)

# this needs to be overriden by Ships
func _add_cannon(weapon_instance, weapon_data : ShipWeaponData) -> void:
	pass


# every unit could have one so this should work here.
func _add_follower(weapon_instance, weapon_data : ShipWeaponData) -> void:
	_followers_container.add_child(weapon_instance)


func update_weapons(delta : float) -> void:
	pass
	# loop through all weapons and call update on them
