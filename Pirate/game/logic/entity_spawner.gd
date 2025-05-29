extends Node2D
class_name EntitySpawner

signal player_spawned(player)
# will probably want this passed in
@export var _player_ship_scene : PackedScene = preload("res://game/entities/units/ships/player_ship/player_ship.tscn")

@onready var _player_spawn_pos := %PlayerSpawnPos

func on_level_start():
	_spawn_player()

func _spawn_player() -> void:
	var player = _spawn_entity(_player_ship_scene, _player_spawn_pos.global_position, true)
	player_spawned.emit(player)
	
func _spawn_entity(scene : PackedScene, pos : Vector2, is_player : bool = false, data : Resource = null) -> RigidBody2D:
	var entity : Entity = scene.instantiate()
	entity.global_position = pos
	
	if data:
		entity.set_data(data)
	
	add_child(entity)
	return entity
