extends Panel

@onready var _label : Label = $HBoxContainer/GoldAmountLabel
@onready var _minus_100 : Button = $"HBoxContainer/-100Button"
@onready var _minus_50 : Button = $"HBoxContainer/-50Button"
@onready var _minus_10 : Button = $"HBoxContainer/-10Button"
@onready var _plus_10 : Button = $"HBoxContainer/+10Button"
@onready var _plus_50 : Button = $"HBoxContainer/+50Button"
@onready var _plus_100 : Button = $"HBoxContainer/+100Button"

func _ready() -> void:
	_minus_10.pressed.connect(_change_gold.bind(-10))
	_minus_50.pressed.connect(_change_gold.bind(-50))
	_minus_100.pressed.connect(_change_gold.bind(-100))
	_plus_10.pressed.connect(_change_gold.bind(10))
	_plus_50.pressed.connect(_change_gold.bind(50))
	_plus_100.pressed.connect(_change_gold.bind(100))
	
	_update_label(RunData.gold)
	SignalBus.gold_changed.connect(_update_label)


func _change_gold(amount : int) -> void:
	RunData.gold += amount


func _update_label(amount) -> void:
	_label.text = "Gold: " + str(amount)
