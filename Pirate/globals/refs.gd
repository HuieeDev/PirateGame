extends Node
# this class is for globally accessible values, that we want to be able to change
# in the inspector

@export_group("Stat Display Colours")
@export var positive_col := Color.GREEN
@export var neutral_col := Color.WHITE
@export var negative_col := Color.RED


@export_group("Projectile Collision Layers")
@export_flags_2d_physics var player_projectile_layer
@export_flags_2d_physics var player_projectile_mask
@export_flags_2d_physics var enemy_projectile_layer
@export_flags_2d_physics var enemy_projectile_mask
