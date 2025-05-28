extends Resource
class_name ItemParentData

enum Tier{COMMON, UNCOMMON, RARE, LEGENDARY}

@export var my_id := ""
@export var name := ""
@export var unlocked_by_default := false
@export var icon : Resource #maybe change this type
@export var tier := Tier.COMMON
@export var value := 1
@export var effects : Array[Effect] = []
