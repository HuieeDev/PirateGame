extends PanelContainer
class_name ItemSlot

@export var _item_name_label : Label
@export var _texture_rect : TextureRect
@export var _buy_button: Button

var _item_data : ItemParentData

func display_item(data : ItemParentData) -> void:
	_item_data = data
	_display_name()
	_display_cost()
	_try_display_image() 


func _display_name() -> void:
	_item_name_label.text = _item_data.name


func _try_display_image() -> void:
	if _item_data.icon != null:
		_texture_rect.texture = _item_data.icon


func _display_cost() -> void:
	_buy_button.text = str(_item_data.value) + " gold"
