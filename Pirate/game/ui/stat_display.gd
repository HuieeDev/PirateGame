extends Control
class_name StatDisplay

@export var _stat_to_display : String

@onready var name_label := $HBoxContainer/StatName
@onready var value_label := $HBoxContainer/StatValue

func display_stat() -> void:
	var stat_value = RunData.get_stat(_stat_to_display.to_lower())
	var value_text = str(stat_value as int)
	value_label.text = value_text
