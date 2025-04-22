extends Node2D

const SAVEFILE: String = "user://score.save"

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var ground: Ground = $Ground
@onready var ui: UI = $UI

var score: int = 0
var high_score: int = 0

func _ready() -> void:
	load_highscore()

func load_highscore() -> void:
	var file: FileAccess = FileAccess.open(SAVEFILE, FileAccess.READ)
	if file:
		high_score = file.get_32()

func save_score() -> void:
	if score > high_score:
		var file: FileAccess = FileAccess.open(SAVEFILE, FileAccess.WRITE)
		if file:
			file.store_32(score)


func _on_player_on_game_started( ) -> void:
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
	load_highscore()
	ui.game_over()
	ui.calculate_score(score, high_score)

func _on_spawner_on_player_scored() -> void:
	score += 1
	save_score()
	ui.update_score(score)
