extends Node2D
class_name Main

# should be a packed scene we load in and then call funcs on to load it properly
# but for now this works 
@onready var _level := $Level

func _ready() -> void:
	Global.main = self

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		pass
		#get_tree().paused = not get_tree().paused

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("DebugStartLevel"):
		_level.start()
