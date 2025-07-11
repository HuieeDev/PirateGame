extends Node2D
class_name Weapon

var _stats : ShipWeaponStats = null

var _timer := 0.0

var _parent : Unit
var _parent_type : int

func init(data : ShipWeaponData, parent, parent_type : int) -> void:
	_reset_attack_timer()
	_stats = data.stats
	_parent = parent
	_parent_type = parent_type


func _reset_attack_timer() -> void:
	_timer = 0.0


func update_weapon(delta: float) -> void:
	_timer += delta
	if _timer >= _stats.attack_speed: # apply any global attack speed modifiers here i.e. enemy attack speed increase
		_on_attack()
		_reset_attack_timer()


# override in children
func _on_attack() -> void:
	pass
