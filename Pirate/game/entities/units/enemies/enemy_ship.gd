extends Enemy
class_name EnemyShip

@onready var _cannon_positions := $CannonPositions

func _setup_weapons() -> void:
	_weapons_container.set_cannon_positions(_cannon_positions.get_children())
	super()
