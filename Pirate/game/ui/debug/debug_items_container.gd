extends VBoxContainer
class_name DebugItemVBoxContainer

var _debug_item_select_button_scene : PackedScene = preload("res://game/ui/debug/debug_select_item_button.tscn")

signal item_selected(item_data:ItemParentData)

func create_buttons(items : Array[ItemParentData]) -> void:
	for item in items:
		var button : Button = _debug_item_select_button_scene.instantiate()
		button.text = item.name
		add_child(button)
		button.pressed.connect(_on_item_pressed.bind(item))


func _on_item_pressed(item_data : ItemParentData) -> void:
	item_selected.emit(item_data)
