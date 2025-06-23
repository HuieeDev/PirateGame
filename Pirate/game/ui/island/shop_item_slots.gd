extends HBoxContainer
class_name ShopItemsContainer

signal shop_item_bought(shop_item)

var _item_slots : Array[ItemSlot]

func _ready() -> void:
	for child in get_children():
		if child is ItemSlot:
			_item_slots.push_back(child)


func display_items(items : Array[ItemParentData]) -> void:
	# create item slot for each item
	for i in _item_slots.size():
		if i < items.size(): 
			_item_slots[i].display_item(items[i])
		else:
			# TODO: create a deactivated function in ItemSlot
			_item_slots[i].hide()
		# hook up to the items events that we care about
