extends Timer
class_name LevelTimer

var _prev_time_remaining : int

func start_timer(time_sec: float = -1)-> void:
	start(time_sec)
	_prev_time_remaining = ceili(time_sec)
	SignalBus.level_timer_updated.emit(_prev_time_remaining)
	
func _process(delta: float) -> void:
	if not is_stopped():
		var new_time_left = ceili(time_left)
		if new_time_left < _prev_time_remaining:
			_prev_time_remaining = new_time_left
			SignalBus.level_timer_updated.emit(new_time_left)
