extends Node

func _ready():
	DisplayServer.window_set_size(Vector2i(1280,720))
	var screen_center = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(screen_center - window_size / 2) 
