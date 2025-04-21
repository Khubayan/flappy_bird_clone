extends CharacterBody2D

class_name Player

signal on_game_started

@export var gravity: float = 1000
@export var jump_force: float = -400
@export var max_speed: float = 400
@export var rotation_speed = 2

var is_game_started: bool = false
var should_process_input: bool = true



func _physics_process(delta: float) -> void:
	#check for jump input
	if Input.is_action_just_pressed("jump") and should_process_input:
		jump_player()
		if not is_game_started:
			is_game_started = true
			on_game_started.emit()
		
	if not is_game_started:
		return
	
		
	#apply gravity
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_speed)
	
 
	move_and_slide()
	
	#rotate the player when falling
	rotate_player(delta)



func jump_player() -> void:
	velocity.y = jump_force
	rotation = deg_to_rad(-30)

func rotate_player(delta: float) -> void:
	if velocity.y > 0 and rotation < deg_to_rad(90):
		rotation += rotation_speed * delta
