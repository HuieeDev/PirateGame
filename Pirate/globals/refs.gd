extends Node
# this class is for globally accessible values, that we want to be able to change
# in the inspector

@export_group("Stat Display A")
@export var positive_col := Color.GREEN
@export var neutral_col := Color.WHITE
@export var negative_col := Color.RED

@export_group("Group B")
@export var icon_a : Texture2D
@export var icon_b : Texture2D
