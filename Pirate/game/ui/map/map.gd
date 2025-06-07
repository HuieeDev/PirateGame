extends Control
class_name MapUI

@onready var _line := $Line2D

@onready var _islands_container : Control = $Islands
var _islands : Array[IslandButton]

# this will all need changing in the future
func _ready() -> void:
	_line.hide()
	_line.clear_points()
	
	for child in _islands_container.get_children():
		_islands.append(child)
	
	# base island
	var starting_pos := _islands[0].get_exit_point()
	_line.add_point(starting_pos)
	
	for island in _islands:
		if island == _islands[0]:
			continue
		island.mouse_entered.connect(_on_mouse_entered_island.bind(island))
		island.mouse_exited.connect(_on_mouse_exited)
		island.button_down.connect(_on_island_selected)


func _on_mouse_entered_island(island : IslandButton) -> void:
	if island:
		_line.add_point(island.get_enter_point())
		_line.show()


func _on_mouse_exited() -> void:
	_line.remove_point(1)
	_line.hide()


func _on_island_selected() -> void:
	SignalBus.exit_map.emit()


func _on_set_sail_button_down() -> void:
	SignalBus.exit_map.emit()
