@tool
extends PanelContainer

@export_category("Message Settings")
@export var message : String = "insert message here"
@export_enum("Player", "Other") var sender : String = "Player"
@export_enum("Only", "Top", "Middle", "Bottom") var message_position : String = "Only"

@onready var message_label : Label = $MarginContainer/Label
@onready var message_bubble : PanelContainer = self

const corner_radius : int = 15
const shorter_corner_radius : int = 3

func _ready():
	message_label.text = message
	
	var sb := StyleBoxFlat.new()
	var ls := LabelSettings.new()
	
	match sender:
		"Player":
			sb.bg_color = Color("#1588ff")
			message_bubble.size_flags_horizontal = Control.SIZE_SHRINK_END
			ls.font_color = Color("#ffffff")
			
		"Other":
			sb.bg_color = Color("#e5e4ea")
			message_bubble.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
			ls.font_color = Color("#000000")
	
	match message_position:
		"Only":
			sb.set_corner_radius_all(corner_radius)
		"Top":
			sb.corner_radius_top_left = corner_radius
			sb.corner_radius_top_right = corner_radius
			sb.corner_radius_bottom_left = corner_radius if sender == "Player" else shorter_corner_radius
			sb.corner_radius_bottom_right = shorter_corner_radius if sender == "Player" else corner_radius
		"Middle":
			sb.corner_radius_top_left = corner_radius if sender == "Player" else shorter_corner_radius
			sb.corner_radius_top_right = shorter_corner_radius if sender == "Player" else corner_radius
			sb.corner_radius_bottom_left = corner_radius if sender == "Player" else shorter_corner_radius
			sb.corner_radius_bottom_right = shorter_corner_radius if sender == "Player" else corner_radius
		"Bottom":
			sb.corner_radius_top_left = corner_radius if sender == "Player" else shorter_corner_radius
			sb.corner_radius_top_right = shorter_corner_radius if sender == "Player" else corner_radius
			sb.corner_radius_bottom_left = corner_radius 
			sb.corner_radius_bottom_right = corner_radius
	
	message_bubble.add_theme_stylebox_override("panel", sb)
	message_label.label_settings = ls
