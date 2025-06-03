extends Node

# This holds all global Signals

signal PlayerSpawned(player)

# Player stats change
signal PlayerShipPickupRadiusChanged(new_radius)

signal level_timer_updated(time_left : int)
signal level_timeout
