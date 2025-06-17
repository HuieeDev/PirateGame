extends RefCounted
class_name SIGlue

# this Glue Util class is for variables where when the value is updated, an event should be fired

## Example use
#signal health_changed(value:int)
#const HEALTH_MIN : int = 0
#const HEALTH_MAX : int = 100
#
#var health : int = 0:
	#set(value): health = SIGlue.int_clamped(value, HEALTH_MIN, HEALTH_MAX, health_changed)

static func int_clamped(value: int, min: int, max: int, changed_signal : Signal) -> int:
	var r: int = clampi(value, min, max)
	changed_signal.emit(r)
	return r
