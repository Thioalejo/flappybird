extends Node2D
class_name Obstacle

signal on_player_crashed # player a collisionado
signal on_player_scored # para guardar score del player
@export var move_speed:= 150.0
@onready var hit_sound: AudioStreamPlayer2D = $HitSound
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

func _process(delta: float) -> void:
	position.x -= move_speed * delta

func set_speed(value:float) -> void:
	move_speed = value

#Señal reutilizada para ostaculo top y botton
func _on_area_body_entered(body: Node2D) -> void:
	hit_sound.play()
	on_player_crashed.emit()
	


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_score_area_body_entered(body: Node2D) -> void:
	score_sound.play()
	on_player_scored.emit()
	
