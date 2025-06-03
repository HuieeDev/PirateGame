extends Area2D
class_name Item

signal picked_up(item)

@onready var  _sprite := $Sprite2D

func set_texture(texture : Texture2D) -> void:
	if _sprite:
		_sprite.texture = texture


func pickup() -> void:
	picked_up.emit(self)
	queue_free()
	
