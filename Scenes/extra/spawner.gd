extends Node
class_name Spawner

const OBSTACLE_SCENE = preload("res://Scenes/Obstacle/obstacle.tscn")
@onready var timer: Timer = $Timer

func spawn_obstacle() -> void:
	var obs_instance = OBSTACLE_SCENE.instantiate()
	
	#referencia de viewport para trar ostaculos fuera de la pantalla
	var viewport: Viewport = get_viewport()
	#para posicionar ostaculo 150 puntos fuera de la pantalla
	obs_instance.position.x = viewport.get_visible_rect().end.x + 150
	
	#Instancia de cada ostaculo de manera en random
	#Devulve la posicion central del eje Y
	var half_height = viewport.size.y /2
	obs_instance.position.y = randf_range(half_height + 240, half_height - 50)
	
	add_child(obs_instance)

func _on_timer_timeout() -> void:
	spawn_obstacle()
