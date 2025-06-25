extends Control
class_name StatDisplay

@export var _stat_to_display : String

@onready var _name_label := $HBoxContainer/StatName
@onready var _value_label := $HBoxContainer/StatValue

func _ready() -> void:
	RunData.item_added.connect(_on_item_added)


func display_stat() -> void:
	_name_label.text = _stat_to_display
	
	var stat_value : float = Utils.get_stat(_stat_to_display.to_lower())
	_display_stat_value(stat_value)
	
	if stat_value > 0:
		_name_label.modulate = Refs.positive_col
		_value_label.modulate = Refs.positive_col
	elif stat_value < 0:
		_name_label.modulate = Refs.negative_col
		_value_label.modulate = Refs.negative_col
	else:
		_name_label.modulate = Refs.neutral_col
		_value_label.modulate = Refs.neutral_col


func _on_item_added(item) -> void:
	var stat_value : float = Utils.get_stat(_stat_to_display.to_lower())
	_display_stat_value(stat_value)


func _display_stat_value(stat_value : float) -> void:
	var value_text = str(stat_value as int)
	_value_label.text = value_text
