extends CanvasLayer
class_name UIManager

@onready var _stats : StatsUI = %Stats
@onready var _level_ui := $LevelUI
@onready var _island_ui := $Island

var is_paused = false

func _ready() -> void:
	is_paused = false
	
	SignalBus.level_start.connect(_on_level_start)
	SignalBus.level_end.connect(_on_level_end)
	
	SignalBus.enter_island.connect(_on_island_start)
	SignalBus.exit_island.connect(_on_island_end)
	
	_stats.hide()
	_level_ui.hide()
	
	# for now start on the island
	_island_ui.show()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		is_paused = not is_paused
		_stats.show_stats() if is_paused else _stats.hide()

func _on_level_start() -> void:
	_level_ui.show()

func _on_level_end() -> void:
	_level_ui.hide()

func _on_island_start() -> void:
	_island_ui.show()

func _on_island_end() -> void:
	_island_ui.hide()
