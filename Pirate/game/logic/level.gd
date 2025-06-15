extends Node2D
class_name Level

@onready var entity_spawner := %EntitySpawner
@onready var _projectile_manager:= $ProjectileManager

# this should be set by some manager, but for now make it editabe in inspector
@export var level_duration : float = 60

@onready var timer := $LevelTimer

func start() -> void:
	entity_spawner.on_level_start()
	timer.start_timer(level_duration)
	SignalBus.level_start.emit()


func _on_level_timer_timeout() -> void:
	SignalBus.level_timeout.emit()


func clean_up() -> void:
	entity_spawner.clean_up()
	_projectile_manager.clean_up()
	timer.stop()
	# TODO: only do this once everything is cleaned up and freed
	SignalBus.level_end.emit()
