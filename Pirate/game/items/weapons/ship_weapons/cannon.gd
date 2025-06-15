extends Weapon
class_name Cannon

signal projectile_shot(projectile : Projectile)


@onready var _firing_point := %FiringPoint

func _on_attack() -> void:
	var projectile = Global.projectile_manager.spawn_projectile(_parent.rotation + rotation, _stats, _firing_point.global_position, _parent_type, self)
	projectile_shot.emit(projectile)
