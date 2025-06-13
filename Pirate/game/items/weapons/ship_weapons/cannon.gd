extends Weapon
class_name Cannon

@export var _projectile_scene : PackedScene

@onready var _firing_point := %FiringPoint

func _on_attack() -> void:
	if _projectile_scene:
		#spawn projectile
		# probably want some global projectile manager as we'll have a load of them
		pass
