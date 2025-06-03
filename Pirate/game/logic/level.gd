extends Node2D

@onready var entity_spawner := %EntitySpawner

# this should be set by some manager, but for now make it editabe in inspector
@export var level_duration : float = 60

@onready var timer := $LevelTimer

func start() -> void:
	entity_spawner.on_level_start()
	timer.start_timer(level_duration)


func _on_level_timer_timeout() -> void:
	SignalBus.level_timeout.emit()
