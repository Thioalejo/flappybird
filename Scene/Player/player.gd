extends CharacterBody2D

@export var gravity := 1000.0
@export var jump_force := 400.0
@export var max_speed :=400.0
@export var rotation_speed := 2.0

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_speed)
	
	if Input.is_action_pressed("jump"):
		jump()
	
	move_and_slide()
	rotate_player()

func jump() -> void:
	velocity.y = -jump_force
	rotation = deg_to_rad(-30)
	
func rotate_player() -> void:
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
		
