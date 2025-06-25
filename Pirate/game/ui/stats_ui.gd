extends Control
class_name StatsUI

var _stat_displays : Array[StatDisplay]

@onready var _stats_display_container : VBoxContainer = %StatsDisplayContainer

func _ready() -> void:
	var container_children = _stats_display_container.get_children()
	for child in container_children:
		# TODO: maybe throw an error if it's not a stat display
		if child is StatDisplay:
			_stat_displays.append(child)


func show_stats() -> void:
	show()
	display_stats()


func display_stats() -> void:
	for display in _stat_displays:
		display.display_stat()
	pass
