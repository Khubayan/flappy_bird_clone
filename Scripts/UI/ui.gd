extends CanvasLayer
class_name  UI

const MEDAL_BRONZE = preload("res://Assets/Sprites/UI/medalBronze.png")
const MEDAL_GOLD = preload("res://Assets/Sprites/UI/medalGold.png")
const MEDAL_SILVER = preload("res://Assets/Sprites/UI/medalSilver.png")
@onready var medal_img: TextureRect = %"Medal IMG"
@onready var current_score: Label = %CurrentScore
@onready var high_score: Label = %HighScore
@onready var score_label: Label = %ScoreLabel
@onready var start_menu: Control = $MarginContainer/StartMenu
@onready var game_over_container: VBoxContainer = %GameOver



func _ready() -> void:
	score_label.text = "0"

func update_score(value: int) -> void:
	score_label.text = str(value)

func game_over() -> void:
	game_over_container.show()
	score_label.hide()

func calculate_score(current: int, high: int) -> void:
	const MIN_GET_MEDAL_GOLD = 20
	const MIN_GET_MEDAL_SILVER = 10
	
	current_score.text = str(current)
	if current >= MIN_GET_MEDAL_GOLD:
		medal_img.texture = MEDAL_GOLD
	elif current >= MIN_GET_MEDAL_SILVER:
		medal_img.texture = MEDAL_SILVER
	else:
		medal_img.texture = MEDAL_BRONZE
	high_score.text = str(high)


func _on_ok_button_pressed() -> void:
	get_tree().reload_current_scene()
