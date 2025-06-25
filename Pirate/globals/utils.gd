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
