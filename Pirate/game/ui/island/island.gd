extends Control


func _on_set_sail_button_button_down() -> void:
	SceneChanger.play_animation()
	SignalBus.exit_island.emit()
