extends Resource
class_name Effect

enum Sign{POSITIVE, NEGATIVE, NEUTRAL, FROM_VALUE} #FROM_VALUE, FROM_ARG also could be added
enum StorageMethod{SUM, KEY_VALUE, REPLACE}

@export var key := ""
@export var text_key := ""
@export var value := 0
@export var custom_key := ""
@export var storage_method := StorageMethod.SUM
@export var effect_sign := Sign.FROM_VALUE
@export var custom_args := []

var base_value := 0

static func get_id() -> String:
	return "effect"

# apply the value of the effect to the run data stats
func apply() -> void:
	pass

func unapply() -> void:
	pass

func get_text() -> String:
	var text = "Effect.get_text() not implemented"
	
	return text
