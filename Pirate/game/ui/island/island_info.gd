extends Resource
class_name IslandInfo

enum IslandSizes
{
	SMALL, MEDIUM, LARGE
}

@export var size := IslandSizes.SMALL
# all the possible island textures, to provide variance
@export var island_textures : Array[Texture2D]
# the number of sites where the player can do stuff. i.e. shops, tavern
@export var min_num_interactions : int = 2 
@export var max_num_interactions : int = 3 
