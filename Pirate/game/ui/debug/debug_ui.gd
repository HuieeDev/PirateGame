extends CanvasLayer

@onready var _stats_change_container : DebugStatsChangerContainer = $"Panel/Stats Changer Container"

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if OS.is_debug_build() and Input.is_action_just_pressed("DisplayDebug"):
		visible = not visible
		if visible:
			_stats_change_container.on_show()
