extends Control
class_name MapUI

@onready var _line := $Line2D

@onready var _islands_container : Control = $Islands
var _islands : Array[Control]

# this will all need changing in the future
func _ready() -> void:
	_line.hide()
	_line.clear_points()
	
	for child in _islands_container.get_children():
		_islands.append(child)
	
	# base island
	var starting_pos := _islands[0].global_position + _islands[0].pivot_offset
	_line.add_point(starting_pos)
	
	for island in _islands:
		if island == _islands[0]:
			continue
		island.mouse_entered.connect(_on_mouse_entered.bind(island))
		island.mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered(island : Control) -> void:
	if island:
		_line.add_point(island.global_position + island.pivot_offset)
		_line.show()
		
func _on_mouse_exited() -> void:
	_line.remove_point(1)
	_line.hide()
