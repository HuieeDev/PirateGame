extends RigidBody2D
class_name Entity

signal died(entity)

var dead = false
var cleaning_up = false

var _min_pos: = Vector2(-9999, -9999)
var _max_pos: = Vector2(9999, 9999)

@onready var sprite := %Sprite2D as Sprite2D
@onready var _animation_player := $AnimationPlayer as AnimationPlayer
@onready var _animation = $Animation as Node2D
@onready var _collision : CollisionShape2D = %CollisionShape2D

func init(zone_min_pos:Vector2, zone_max_pos:Vector2, entity_spawner_ref = null)->void :
	pass
	#_min_pos = Vector2(
		#zone_min_pos.x + sprite.texture.get_width() / 2.0, 
		#zone_min_pos.y + sprite.texture.get_height() / 2.0
	#)
#
	#_max_pos = Vector2(
		#zone_max_pos.x - sprite.texture.get_width() / 2.0, 
		#zone_max_pos.y - sprite.texture.get_height() / 2.0
	#)

func set_data(data : Resource):
	pass


func get_entity_type() -> int:
	return EntityType.NEUTRAL


func die():
	dead = true
	died.emit(self)
	queue_free()
