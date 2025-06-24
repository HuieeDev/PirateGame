extends VBoxContainer
class_name DebugStatsChangerContainer

var _child_stat_containers : Array

func _ready() -> void:
	for child in get_children():
		if child is DebugStatContainer:
			_child_stat_containers.push_back(child)


func on_show() -> void:
	for stat_container in _child_stat_containers:
		stat_container.on_debug_display()
