extends Unit
class_name Enemy

@export var gold_to_drop : int = 0
@export var gold_scene : PackedScene


func get_entity_type() -> int:
	return EntityType.ENEMY
