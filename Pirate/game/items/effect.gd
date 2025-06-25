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

var _base_value := 0

static func get_id() -> String:
	return "effect"

# apply the value of the effect to the run data stats
func apply() -> void:
	if custom_key != "" or storage_method == StorageMethod.KEY_VALUE:
		RunData.effects[custom_key].push_back([key, value])
	elif storage_method == StorageMethod.REPLACE:
		_base_value = RunData.effects[key]
		RunData.effects[key] = value
	else:
		RunData.effects[key] += value

func unapply() -> void:
	if custom_key != "" or storage_method == StorageMethod.KEY_VALUE:
		RunData.effects[custom_key].erase([key, value])
	elif storage_method == StorageMethod.REPLACE:
		RunData.effects[key] = _base_value
	else:
		RunData.effects[key] -= value

func get_text() -> String:
	var text = "Effect.get_text() not implemented"
	
	return text
