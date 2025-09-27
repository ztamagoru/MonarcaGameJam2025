extends Control

@onready var header : PanelContainer = $PanelContainer2/VBoxContainer/Header

var dragging : bool = false
var drag_offset : Vector2 = Vector2.ZERO

func _ready():
	header.mouse_filter = Control.MOUSE_FILTER_STOP
	#pass

func _input(event : InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and header.get_global_rect().has_point(event.global_position):
			dragging = true
			drag_offset = event.global_position
		elif not event.pressed:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		global_position += event.relative
