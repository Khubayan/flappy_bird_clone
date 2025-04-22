extends Node2D
class_name Spawner

signal  on_obstacle_collide
signal on_player_scored

const OBSTACLE = preload("res://Scenes/Obstacles/obstacle.tscn")
@onready var timer: Timer = $Timer


func create_obstacle() -> void:
	var obstacle = OBSTACLE.instantiate()
	obstacle.on_plane_crash.connect(_on_plane_crash)
	obstacle.on_player_scored.connect(_on_player_scored)
	var viewport: Rect2 = get_viewport_rect()
	obstacle.position.x = viewport.end.x + 150
	var half = viewport.size.y / 2
	obstacle.position.y = randf_range(half + 240, half - 50)
	
	add_child(obstacle)

func stop_obstacle() -> void:
	timer.stop()
	for obs: Obstacle in get_children().filter(func(child): return child is Obstacle):
		obs.set_speed(0)

func _on_timer_timeout() -> void:
	create_obstacle()

func _on_plane_crash() -> void:
	on_obstacle_collide.emit()
	stop_obstacle()

func _on_player_scored() -> void:
	on_player_scored.emit()
