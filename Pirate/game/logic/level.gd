extends Node2D

@onready var entity_spawner := %EntitySpawner

func start() -> void:
	entity_spawner.on_level_start()
