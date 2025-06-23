extends TextureButton

@export var name_id : String

@onready var name_label := $Name

func _ready() -> void:
	name_label.text = tr(name_id)
