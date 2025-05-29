extends CanvasLayer

@onready var _stats : StatsUI = %Stats

var is_paused = false

func _ready() -> void:
	_hide()
	is_paused = false

func _hide():
	_stats.hide()

func _show():
	_stats.show_stats()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		is_paused = not is_paused
		_show() if is_paused else _hide()
