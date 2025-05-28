extends ItemParentData
class_name ShipUpgradeData

# if -1, then unlimited number of these upgrades available
@export var max_number : int = -1

func get_category() -> int:
	return Utils.ItemCategory.SHIP_UPGRADE
