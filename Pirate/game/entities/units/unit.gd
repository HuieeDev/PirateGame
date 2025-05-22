extends Entity
class_name Unit

signal speed_changed
signal health_updated(current_health, max_health)
signal took_damage(unit, value)
