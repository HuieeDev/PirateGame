extends Node
#this class is for globally accessible helper enums and functions


#enums go here

enum ItemCategory
{
	ITEM, SHIP_UPGRADE, WEAPON, ENEMY, PLAYER, COLLECTABLE
}

enum ShipWeaponTypes
{
	CANNON, PROW, FOLLOWER, MISC
}


#funcs
static func get_random_element(array: Array):
	return array[Utils.get_random_int(0, array.size() - 1)]


static func get_random_int(min : int, max: int) -> int:
	return randi_range(min, max)


func get_stat(stat_name : String) -> float:
	return RunData.get_stat(stat_name) # TODO: + TempStats.get_stat() + LinkedStats.get_stat()


static func is_pair(a : int, b : int) -> bool:
	return a == b


static func is_odd(a : int) -> bool:
	return a % 2 == 1


static func is_even(a : int) -> bool:
	return a % 2 == 0


static func is_between_inclusive_f(num : float, min: float, max : float) -> bool:
	return num >= min and num <= max


static func is_between_inclusive_i(num : int, min : int, max: int) -> bool:
	return num >= min and num <= max
