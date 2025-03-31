extends Node2D

@onready var spawner: Spawner = $Spawner
@onready var player: Player = $Player
@onready var game_ui: GameUI = $GameUI

var score: int 

func _on_player_on_game_started() -> void:
	spawner.timer.start()
	game_ui.start_menu.hide()

func _on_spawner_on_obstacle_crashed() -> void:
	player.stop_movement()

func _on_ground_on_player_crsh() -> void:
	spawner.stop_obstacles()
	game_ui.game_over()


func _on_spawner_on_player_score() -> void:
	score += 1
	game_ui.update_score(score)
	#print(score)
