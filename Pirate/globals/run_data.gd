extends Node

# in brotato this is: "burn_chance", "structures", "explode_on_hit", "explode_on_death", "explode_on_consumable", "convert_stats_end_of_wave", "convert_stats_half_wave"
var effect_keys_full_serialization = [""]

# in brotato this is: "projectiles_on_death", "alien_eyes"
var effect_keys_with_weapon_stats = [""]

var current_run_accessibility_settings:Dictionary

var current_living_enemies: = 0
# var current_living_trees := 0 <- maybe we have some equivalent?

var resumed_from_state := false

var num_of_waves := 5 # total number of waves in run (b4 endless or whateva)
var current_level: = 0
var current_xp: = 0.0
var current_wave : int
var current_difficulty : int
var gold : int
var weapons : Array
var items : Array
var ship_appearances_displayed : Array
var run_won : bool
var live_stats : Dictionary
var challenges_completed_this_run := []
#var reload_music = true
#var current_character : CharacterData
var current_ship_stats : ShipStats
#var starting_weapons : Array[WeaponData]

var invulnerable = false
var is_testing = false

func _ready() -> void:
	#want to add in ship here
	_init_stats_to_default()
	pass
	
func reset(restart:bool = false) -> void:
	weapons = []
	items = []

# TODO: create character, ship and weapon stat resources. Pass through as params
func add_character() -> void:
	pass

func add_ship() -> void:
	pass

func add_weapon() -> void:
	pass

func get_stat(stat_name:String) ->float:
	return live_stats[stat_name.to_lower()] * get_stat_gain(stat_name)

func get_stat_gain(stat_name:String) -> float:
	if not live_stats.has("gain_" + stat_name.to_lower()):
		return 1.0
	
	return 1.0 +(live_stats["gain_" + stat_name.to_lower()] / 100.0)
	
func _init_stats_to_default(all_null_values : bool = false) -> void:
	live_stats.clear()
	live_stats =  {
		"max_hp": 10 if not all_null_values else 0,
		"pickup_range": PlayerPickupArea.BASE_RADIUS if not all_null_values else 0,
		"forward_speed" : 40 if not all_null_values else 0,
		"turning_speed" : 10 if not all_null_values else 0,
	}

func init_stats_from_player(stats : PlayerShipStats) -> void:
	live_stats.clear()
	live_stats = {
		"max_hp" : stats.health,
		"pickup_range" : stats.pickup_range,
		"forward_speed" : stats.forward_speed,
		"turning_speed" : stats.turning_speed,
	}
