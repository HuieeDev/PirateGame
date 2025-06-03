extends Node
# this class is for globally accessible values, that we want to be able to change
# in the inspector

@export_group("Stat Display Colours")
@export var positive_col := Color.GREEN
@export var neutral_col := Color.WHITE
@export var negative_col := Color.RED
