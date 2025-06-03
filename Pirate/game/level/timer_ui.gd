extends Label

func _ready() -> void:
	SignalBus.level_timer_updated.connect(update_ui)

func update_ui(time:int):
	var seconds := time
	var minutes := seconds / 60
	if minutes > 0:
		set_text("%2d:%02d" % [minutes%60, seconds%60])
	else:
		set_text("%02d" % [seconds%60])
		
