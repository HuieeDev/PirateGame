extends Control
class_name ShopScreen

signal item_bought(item_data)
signal exit_screen

@export var _item_slots_parent : ShopItemsContainer

var _reroll_price : int = 0
var _free_rerolls : int = 0
var _shop_items : Array[ItemParentData]

var initialised : bool = false

func init() -> void:
	_assign_shop_items()
	initialised = true

func _assign_shop_items() -> void:
	# By default, we get 4 items
	_shop_items = _get_shop_items()
	_display_shop_items()


func _get_shop_items() -> Array[ItemParentData]:
	return ItemService.get_shop_items()


func _display_shop_items() -> void:
	_item_slots_parent.display_items(_shop_items)


func _on_exit_button_button_down() -> void:
	exit_screen.emit()
