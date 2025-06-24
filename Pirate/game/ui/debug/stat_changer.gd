extends HBoxContainer
class_name DebugStatContainer

@export var _stat_name : String

@onready var _minus : Button = %MinusButton
@onready var _plus : Button = %PlusButton
@onready var _name : Label = %StatName
@onready var _value : Label = %StatValue

func _ready() -> void:
	if _stat_name != "":
		_name.text = _stat_name
	
	_minus.pressed.connect(_minus_pressed)
	_plus.pressed.connect(_plus_pressed)

func _change_stat_by_amount(amount : int) -> void:
	if not RunData.live_stats == null:
		assert(_stat_name in RunData.live_stats)
		
		RunData.live_stats[_stat_name] += amount
		
		_update_value_display()


func _minus_pressed() -> void:
	_change_stat_by_amount(-1)


func _plus_pressed() -> void:
	_change_stat_by_amount(1)


func on_debug_display() -> void:
	_update_value_display()


func _update_value_display() -> void:
	if not RunData.live_stats == null:
		assert(_stat_name in RunData.live_stats)
		_value.text = str(RunData.get_stat(_stat_name))
