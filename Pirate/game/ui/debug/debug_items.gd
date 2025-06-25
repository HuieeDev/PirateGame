extends Panel

@export var _var_name_in_item_service : String = "items"

@onready var _header : Label = $Header
@onready var _item_container :DebugItemVBoxContainer = $ScrollContainer/VBoxContainer
@onready var _item_name_label : Label = $HBoxContainer/Label
@onready var _add_item_button : Button = $HBoxContainer/Button

var _current_item : ItemParentData = null

func _ready() -> void:
	assert(_var_name_in_item_service in ItemService, "DebugItems variable name is not in ItemService")
	
	var items = ItemService[_var_name_in_item_service]
	
	_item_container.create_buttons(items)
	_item_container.item_selected.connect(_on_item_selected)
	
	_add_item_button.pressed.connect(_add_current_item)
	
	_header.text = _var_name_in_item_service.to_upper()


func _on_item_selected(item_data : ItemParentData) -> void:
	_current_item = item_data
	_item_name_label.text = "Item: " + item_data.name


func _add_current_item() -> void:
	if not _current_item == null: 
		RunData.add_item(_current_item)
