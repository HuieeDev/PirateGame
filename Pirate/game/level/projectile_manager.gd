extends Node2D
class_name ProjectileManager

# this should be one with a visual element
const DEFAULT_PROJECTILE_SCENE = preload("res://game/items/weapons/projectiles/projectile.tscn")

func _enter_tree() -> void:
	Global.projectile_manager = self


func _exit_tree() -> void:
	Global.projectile_manager = null


func spawn_projectile(rotation : float, weapon_stats : RangedShipWeaponStats, pos : Vector2, from : Node = null) -> Projectile:
	var projectile : Projectile
	 
	# might want to do a deferred version. In Brotato, all enemy projectiles are deferred
	
	projectile = weapon_stats.projectile_scene.instantiate() if weapon_stats.projectile_scene else DEFAULT_PROJECTILE_SCENE.instantiate()
	projectile.global_position = pos
	projectile.spawn_position = pos
	projectile.velocity = Vector2.DOWN.rotated(rotation) * weapon_stats.projectile_speed
	projectile.rotation = rotation
	projectile.set_from(from)
	projectile.weapon_stats = weapon_stats.duplicate()
	projectile.set_damage(weapon_stats.damage, weapon_stats.crit_chance, weapon_stats.crit_mult)
	
	add_child(projectile)
	return projectile
