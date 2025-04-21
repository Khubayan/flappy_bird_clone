extends Node2D

class_name Spawner
const OBSTACLE = preload("res://Scenes/Obstacles/obstacle.tscn")
@onready var timer: Timer = $Timer


func create_obstacle() -> void:
	var obstacle = OBSTACLE.instantiate()
	var viewport: Rect2 = get_viewport_rect()
	obstacle.position.x = viewport.end.x + 150
	var half = viewport.size.y / 2
	obstacle.position.y = randf_range(half + 240, half - 50)
	
	add_child(obstacle)
	

func _on_timer_timeout() -> void:
	create_obstacle()
