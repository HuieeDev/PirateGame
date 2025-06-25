extends Node

signal gold_changed(amount)
signal item_added(item)

# in brotato this is: "burn_chance", "structures", "explode_on_hit", "explode_on_death", "explode_on_consumable", "convert_stats_end_of_wave", "convert_stats_half_wave"
var effect_keys_full_serialization = [""]

# in brotato this is: "projectiles_on_death", "alien_eyes"
var effect_keys_with_weapon_stats = [""]

var current_run_accessibility_settings:Dictionary

var current_living_enemies: = 0
# var current_living_trees := 0 <- maybe we have some equivalent?

var resumed_from_state := false

var num_of_waves := 5 # total number of waves in run (b4 endless or whateva)
var current_level: = 0 # TODO: remove this?
var current_xp: = 0.0 # TODO: remove this?
var current_wave : int
var current_difficulty : int
var gold : int:
	set(value): gold = SIGlue.int_clamped(value, 0, 999999, gold_changed)
var weapons : Array
var items : Array
var ship_appearances_displayed : Array
var run_won : bool
var effects : Dictionary
var challenges_completed_this_run := []
#var reload_music = true
var current_ship : PlayerShipData = preload("res://game/items/player_ships/basic_player_ship/basic_player_ship_data.tres")
var current_ship_stats : ShipStats
#var starting_weapons : Array[WeaponData]

var invulnerable = false
var is_testing = false


func reset(restart:bool = false) -> void:
	weapons = []
	items = []
	gold = 10
	effects = _init_effects()
	
	# TODO: change this once ship select screen is in 
	add_player_ship(current_ship)
	ItemService.init_unlocked_pool()


func add_item(item_data : ItemParentData) -> void:
	items.push_back(item_data)
	apply_item_effects(item_data)
	#update_item_related_effects()
	item_added.emit(item_data)


# TODO: create character, ship and weapon stat resources. Pass through as params
func add_player_ship(data : PlayerShipData) -> void:
	current_ship = data
	add_item(data)


func add_ship() -> void:
	pass


func add_weapon() -> void:
	pass


func get_stat(stat_name:String) ->float:
	return effects[stat_name.to_lower()] * get_stat_gain(stat_name)


func get_stat_gain(stat_name:String) -> float:
	if not effects.has("gain_" + stat_name.to_lower()):
		return 1.0
	
	return 1.0 +(effects["gain_" + stat_name.to_lower()] / 100.0)


func _init_effects() -> Dictionary:
	var all_stats = _init_stats_to_default()
	var all_effects = {
		"gain_stat_crit_chance" : 0,
	}
	all_effects.merge(all_stats)
	return all_effects


func _init_stats_to_default(all_null_values : bool = false) -> Dictionary:
	return  {
		"stat_max_hp": 10 if not all_null_values else 0,
		"stat_pickup_range": PlayerPickupArea.BASE_RADIUS if not all_null_values else 0,
		"stat_forward_speed" : 80 if not all_null_values else 0,
		"stat_turn_speed" : 40 if not all_null_values else 0,
		"stat_crit_chance" : 0,
	}


func init_stats_from_player(stats : PlayerShipStats) -> Dictionary:
	return {
		"stat_max_hp" : stats.health,
		"stat_pickup_range" : stats.pickup_range,
		"stat_forward_speed" : stats.forward_speed,
		"stat_turn_speed" : stats.turning_speed,
		"stat_crit_chance" : stats.crit_chance,
	}


func apply_item_effects(item_data : ItemParentData) -> void:
	for effect in item_data.effects:
		effect.apply()
