extends CharacterBody2D

const speed = 500.0

func _physics_process(_delta):
	position.x = 123
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	move_and_slide()
