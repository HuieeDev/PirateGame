extends CanvasLayer

var new_scene_path : String

func play_animation():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop()
	$AnimationPlayer.play("Fade In Out")
	#$AnimationPlayer.animation_finished.connect(_new_scene)

func _new_scene():
	if new_scene_path:
		get_tree().call_deferred("change_scene_to_file", new_scene_path)
