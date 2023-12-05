extends CharacterBody2D

var speed = 300.0
var direction = Vector2.ZERO

func _ready():
	pickDirection()

func pickDirection():
	direction.y = [1,-1].pick_random()
	direction.x = [1,-1].pick_random()

func _physics_process(delta):
	if direction:
		velocity = direction * speed * delta
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, speed  * delta)
	
	var collision = move_and_collide(velocity)
	if collision:
		bounce(collision.get_collider())

func bounce(hit):
	if hit.get_name() == "WallUp" or hit.get_name() == "WallDown":
		direction.y *= -1
	elif hit.get_name() == "WallLeft":
		get_parent().restart()
	elif hit.get_name() == "WallRight":
		direction.x *= -1
		get_parent().modifyPoints(1)
		#get_parent().restart()
	elif hit.get_name() == "Player":
		print(hit.position.x)
		print(position.x)
		if position.x > 143:
			direction.x *= -1
		else:
			direction.x *= -1
			direction.y *= -1
	speed += 20
