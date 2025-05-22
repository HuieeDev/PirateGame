extends CanvasLayer

var new_scene_path : String

#func change_to(new_scene : #var type here. Could be enum, string, id):
	#if $AnimationPlayer.is_playing():
		#$AnimationPlayer.stop()
	#$AnimationPlayer.play("Fade In Out")

func _new_scene():
	get_tree().call_deferred("change_scene_to_file", new_scene_path)
