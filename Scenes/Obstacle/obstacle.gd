extends Node2D

signal on_player_crashed # player a collisionado

@export var move_speed:= 150.0

func _process(delta: float) -> void:
	position.x -= move_speed * delta

#Señal reutilizada para ostaculo top y botton
func _on_area_body_entered(body: Node2D) -> void:
	on_player_crashed.emit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
