extends CharacterBody3D

@export var animation_player : AnimationPlayer

const speed : float = 5.0
const crouch_speed : float = 4.0

var current_speed : float = speed

const walking_head_bop : float = 2.0

const jump_force : float = 3.5
const jump_velocity : float = 4.5
const gravity : float = 8.0

func _process(_delta) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func _input(event):
	if event.is_action_pressed("move_crouch"):
		animation_player.play("crouch", -1, crouch_speed, false)
	
	if event.is_action_released("move_crouch"):
		animation_player.play("crouch", -1, -crouch_speed, true)
