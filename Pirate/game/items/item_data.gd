extends ItemParentData
class_name ItemData

# if -1, then unlimited number of these upgrades available
@export var max_number = -1

@export var tags = []


func get_category() -> int:
	return Utils.ItemCategory.ITEM
