extends Node2D
class_name EntitySpawner

signal player_spawned(player : PlayerShip)
signal number_of_enemies_updated(num_enemies : int)
signal enemy_spawned(enemy)

# will probably want this passed in
@export var _player_ship_scene : PackedScene = preload("res://game/entities/units/ships/player_ship/player_ship.tscn")

# this will be changed to nicer wave data, but this works for now
@export var time_between_spawns : float = 5.0
@export var _enemy_scene : PackedScene = preload("res://game/entities/units/enemies/pirate_ship/pirate_ship.tscn")

@onready var _player_spawn_pos := %PlayerSpawnPos
@onready var _entities_container := $EntitiesContainer

var enemies : Array[Enemy] = []

var _spawn_timer : Timer

func _ready() -> void:
	_spawn_timer = Timer.new()
	_spawn_timer.wait_time = time_between_spawns
	_spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	add_child(_spawn_timer)

func on_level_start():
	_spawn_player()
	_spawn_timer.start()


func clean_up() -> void:
	for enemy in enemies:
		enemy.die()
	
	Global.player.queue_free()
	Global.player._can_move = false
	Global.player = null


func _on_spawn_timer_timeout() -> void:
	var spawn_pos = Vector2(-100, -100)
	var enemy = _spawn_entity(_enemy_scene, spawn_pos)
	enemy_spawned.emit(enemy)
	enemies.append(enemy)


func _spawn_player() -> void:
	var player = _spawn_entity(_player_ship_scene, _player_spawn_pos.global_position, true)
	player_spawned.emit(player)
	Global.player = player


func _spawn_entity(scene : PackedScene, pos : Vector2, is_player : bool = false, data : Resource = null) -> RigidBody2D:
	var entity : Entity = scene.instantiate()
	entity.global_position = pos
	
	if data:
		entity.set_data(data)
	
	_entities_container.add_child(entity)
	return entity
