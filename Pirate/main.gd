extends Node2D
class_name Main

# should be a packed scene we load in and then call funcs on to load it properly
# but for now this works 
@onready var _level := $Level

func _ready() -> void:
	Global.main = self
	
	SignalBus.level_timeout.connect(_on_level_timer_timeout)
	SignalBus.level_end.connect(_on_level_end)
	SignalBus.exit_island.connect(_on_exit_island)
	SignalBus.exit_map.connect(_on_exit_map)

func _on_exit_island() -> void:
	SignalBus.enter_map.emit()

func _on_exit_map() -> void:
	_level.start()

func _on_level_timer_timeout() -> void:
	# need to check the passed through bools #1 and #3 from RunData
	# #3 could be passed through the func
	clean_up_level()

# should only be called once all cleanup from the level is done
func _on_level_end() -> void:
	SignalBus.enter_island.emit()

func clean_up_level(is_last_wave : bool = false, is_run_lost := false, is_run_won := false) -> void:
	if is_run_lost:
		print("lose")
	elif is_run_won:
		print("win")
	
	_level.clean_up()
