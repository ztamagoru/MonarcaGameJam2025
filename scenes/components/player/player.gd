extends CharacterBody3D

@export var animation_player : AnimationPlayer
@export var headbob_player : AnimationPlayer

const speed : float = 5.0
const crouch_speed : float = 4.0

var current_speed : float = speed

const walking_head_bop : float = 1.10

const jump_force : float = 3.5
const jump_velocity : float = 4.5
const gravity : float = 8.0

func _ready():
	headbob_player.play("headbob")
	headbob_player.speed_scale = 0

func _process(_delta) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func _input(event):
	if event.is_action_pressed("move_crouch"):
		animation_player.play("crouch", -1, crouch_speed, false)
	
	if event.is_action_released("move_crouch"):
		animation_player.play("crouch", -1, -crouch_speed, true)
