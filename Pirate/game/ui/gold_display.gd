extends HBoxContainer

@onready var _label : Label = $Label

func _ready() -> void:
	RunData.gold_changed.connect(_on_gold_changed)


func _on_gold_changed(amount) -> void:
	_update_label(str(amount))


func _update_label(str : String) -> void:
	_label.text = str
