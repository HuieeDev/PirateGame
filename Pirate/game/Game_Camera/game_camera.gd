extends Camera2D

@export var _lerp_speed := 20.0

func _ready():
	make_current()

func _process(delta):
	_try_move_to_player(delta)


func _try_move_to_player(delta: float):
	if Global.player:
		global_position = global_position.lerp(Global.player.global_position, 1.0 - exp(-delta * _lerp_speed))
