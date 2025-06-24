extends Control

@onready var _shop_screen : ShopScreen = $ShopScreen
@onready var _shop_button : TextureButton = $IslandShop

func _on_set_sail_button_button_down() -> void:
	SceneChanger.play_animation()
	SignalBus.exit_island.emit()


func _ready() -> void:
	_hide_shop()
	_shop_screen.exit_screen.connect(_hide_shop)
	_shop_button.button_down.connect(_display_shop)
	
	

func _display_shop() -> void:
	if not _shop_screen.initialised:
		_shop_screen.init()
	_shop_screen.show()


func _hide_shop() -> void:
	_shop_screen.hide()
