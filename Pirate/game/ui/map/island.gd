extends TextureButton
class_name IslandButton

@onready var _enter_point = $EnterPoint
@onready var _exit_point = $ExitPoint

func get_enter_point() -> Vector2:
	return _enter_point.global_position


func get_exit_point() -> Vector2:
	return _exit_point.global_position
