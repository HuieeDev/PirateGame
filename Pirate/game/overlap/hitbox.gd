extends Area2D
class_name Hitbox

signal on_something_hit(thing_hit, damage_dealt)
signal on_something_killed(thing_killed)


var damage := 1
var ignored_objects := []
var from = null

@onready var _collision_shape := $CollisionShape2D

func set_damage(dmg : int) -> void:
	damage = dmg
	# any crit or effects should be passed in and assigned here


func hit_something(thing_hit : Node, damage_dealt : int) -> void:
	on_something_hit.emit(thing_hit, damage_dealt)


func killed_something(thing_killed : Node) -> void:
	on_something_killed.emit(thing_killed)


func is_disabled() -> bool:
	return _collision_shape.disabled


func enable() -> void:
	_collision_shape.set_deferred("disabled", false)


func disable() -> void:
	_collision_shape.set_deferred("disabled", true)


func set_collision_data(layer : int, mask : int) -> void:
	collision_layer = layer
	collision_mask = mask
