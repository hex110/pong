extends CharacterBody2D

const speed = 500.0

func _physics_process(_delta):
	position.x = 128
	var input_direction = Input.get_vector("left", "right", "up1", "down1")
	velocity = input_direction * speed
	
	move_and_slide()
