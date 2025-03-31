extends CanvasLayer

class_name GameUI
@onready var score_label: Label = %ScoreLabel
@onready var start_menu: Control = %StartMenu 

func _ready() -> void:
	score_label.text = "0"
	
func update_score(value: int) -> void:
	score_label.text = str(value)
