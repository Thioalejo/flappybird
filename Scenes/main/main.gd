extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player


func _on_player_on_game_started() -> void:
	spawner.timer.start()

func _on_spawner_on_obstacle_crashed() -> void:
	player.stop_movement()

func _on_ground_on_player_crsh() -> void:
	spawner.stop_obstacles()
