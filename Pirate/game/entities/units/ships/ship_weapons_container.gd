extends UnitWeaponsContainer
class_name ShipWeaponsContainer

@onready var _cannons_container := $Cannons

# used for determining position and rotation of cannons on the ship. ORDER MATTERS
var _cannon_positions : Array[Node]
var _current_cannon_index := 0

func set_cannon_positions(nodes : Array[Node]) -> void:
	_cannon_positions = nodes


func _add_cannon(weapon_instance : Weapon, weapon_data : ShipWeaponData) -> void:
	_cannons_container.add_child(weapon_instance)
	weapon_instance.global_position = _cannon_positions[_current_cannon_index].global_position
	weapon_instance.rotation = _cannon_positions[_current_cannon_index].rotation
	
	_current_cannon_index += 1
