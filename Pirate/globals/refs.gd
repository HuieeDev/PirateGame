extends Node
# this class is for globally accessible values, that we want to be able to change
# in the inspector

@export_group("Group A")
@export var color_a : Color
@export var color_b : Color

@export_group("Group B")
@export var icon_a : Texture2D
@export var icon_b : Texture2D
