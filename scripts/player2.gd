extends CharacterBody2D

const speed = 500.0

func _physics_process(_delta):
	position.x = 1152
	var input_direction = Input.get_vector("left", "right", "up2", "down2")
	velocity = input_direction * speed
	
	move_and_slide()
