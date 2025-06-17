extends RefCounted
class_name UIGlue

# helper functions for when you have exported Control nodes which you want to change out in the inspector
# or just during runtime

static func glue(old: Signal, new : Signal, target_func : Callable) -> void:
	if old and old.is_connected(target_func):
		old.disconnect(target_func)
	if new:
		new.connect(target_func)


static func glue_pressed(old: Button, new : Button, target_func : Callable) -> Button:
	glue(old.pressed, new.pressed, target_func)
	return new


static func glue_mouse_entered(old: Control, new: Control, target_func : Callable) -> Control:
	glue(old.mouse_entered, new.mouse_entered, target_func)
	return new


static func glue_mouse_exited(old: Control, new: Control, target_func : Callable) -> Control:
	glue(old.mouse_exited, new.mouse_exited, target_func)
	return new
