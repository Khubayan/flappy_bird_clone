extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var ground: Ground = $Ground
@onready var ui: UI = $UI

var score: int = 0

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	ui.start_menu.hide()


func _on_spawner_on_obstacle_collide() -> void:
	#player.stop_player_movement()
	#ground.speed = 0
	stop_gameplay()


func _on_ground_on_player_hit_ground() -> void:
	#spawner.stop_obstacle() 
	#print("Hit the ground")
	stop_gameplay()


func stop_gameplay() -> void:
	player.stop_player_movement()
	spawner.stop_obstacle() 
	ground.speed = 0


func _on_spawner_on_player_scored() -> void:
	score += 1
	ui.update_score(score)
