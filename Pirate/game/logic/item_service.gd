extends Node

@export var weapons : Array[ItemParentData]
@export var items : Array[ItemParentData]
@export var effects : Array[Effect]
@export var consumables : Array[Resource]

const NB_SHOP_ITEMS : int = 4

@export var chance_weapon : float = 0.35
@export var chance_item : float = 0.65

enum TierData
{
	ALL_ITEMS,
	ITEM,
	WEAPONS,
	CONSUMABLES,
}

var _tiers_data : Array


func _reset_tiers_data() -> void:
	_tiers_data = [
		[[], [], [], [], [], 0, 1.0, 0.0, 1.0],
	]


func init_unlocked_pool() -> void:
	_reset_tiers_data()
	
	for item in items:
		# TODO: check if it's unlocked
		_tiers_data[item.tier][TierData.ALL_ITEMS].push_back(item)
		_tiers_data[item.tier][TierData.ITEM].push_back(item)
	
	for weapon in weapons:
		# TODO: check if it's unlocked
		_tiers_data[weapon.tier][TierData.ALL_ITEMS].push_back(weapon)
		_tiers_data[weapon.tier][TierData.WEAPONS].push_back(weapon)


func get_shop_items(number_of_items : int = NB_SHOP_ITEMS, prev_items : Array = [], locked_items : Array = []) -> Array[ItemParentData]:
	var new_items : Array[ItemParentData] = []
	var nb_weapons_guaranteed = 0
	var nb_weapons_added = 0
	#var guaranteed_items : Array = RunData.effects[""]
	
	for i in number_of_items:
		var type : TierData = TierData.ITEM
		
		var new_item
		
		# adding new_items means we can't have the same item twice in a shop
		var excluded_items = prev_items + new_items
		new_item = _get_rand_item(type, excluded_items, RunData.items)
		
		new_items.push_back(new_item)
	
	return new_items


func _get_rand_item(type : TierData, excluded_items : Array = [], owned_items : Array = []) -> ItemParentData:
	var rand_wanted = randf()
	
	# TODO: once move Tier to its own class to make this nicer
	# TODO: remove this line and get the tier based on conditions we have
	var item_tier : ItemParentData.Tier = ItemParentData.Tier.COMMON
	# get random tier
	#var item_tier : ItemParentData.Tier =  ItemParentData.Tier.keys()[randi() % ItemParentData.Tier.size()]
	
	var pool = _get_pool(item_tier, type)
	var backup_pool = _get_pool(item_tier, type)
	var items_to_remove : Array = []
	
	for shop_item in excluded_items:
		pool.erase(shop_item)
		backup_pool.erase(shop_item)
	
	for item in owned_items:
		if item.max_nb == 1:
			backup_pool.erase(item)
			items_to_remove.push_back(item)
		elif item.max_nb != -1:
			# TODO: finish this
			pass
	
	for item in items_to_remove:
		pool.erase(item)
	
	var item : ItemParentData
	
	if pool.size() == 0:
		if backup_pool.size() > 0:
			item = Utils.get_random_element(backup_pool)
		else:
			item = Utils.get_random_element(_tiers_data[item_tier][type])
	else:
		item = Utils.get_random_element(pool)
	
	return item


func _get_pool(tier : ItemParentData.Tier, type : TierData) -> Array:
	return _tiers_data[tier][type].duplicate()
