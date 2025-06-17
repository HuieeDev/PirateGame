extends Node2D
class_name ProjectileManager

# this should be one with a visual element
const DEFAULT_PROJECTILE_SCENE = preload("res://game/items/weapons/projectiles/projectile.tscn")

func _enter_tree() -> void:
	Global.projectile_manager = self


func _exit_tree() -> void:
	Global.projectile_manager = null


func spawn_projectile(rotation : float, weapon_stats : RangedShipWeaponStats, pos : Vector2, from_parent_type : int, from : Node = null) -> Projectile:
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
	
	if from_parent_type == EntityType.PLAYER:
		projectile.set_hitbox_collision_data(Refs.player_projectile_layer, Refs.player_projectile_mask)
	elif from_parent_type == EntityType.ENEMY:
		projectile.set_hitbox_collision_data(Refs.enemy_projectile_layer, Refs.enemy_projectile_mask)
	
	
	add_child(projectile)
	return projectile


func clean_up() -> void:
	for child in get_children():
		var projectile : Projectile = child as Projectile
		projectile.set_to_be_destroyed()
