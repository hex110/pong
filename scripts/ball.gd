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
	match hit.get_name():
		"WallUp", "WallDown":
			direction.y *= -1
		"WallLeft":
			get_parent().restart()
			get_parent().modifyPoints(-1)
		"WallRight":
			direction.x *= -1
			get_parent().modifyPoints(1)
			get_parent().restart()
		"Player":
			if (position.y > hit.position.y + 80) or (position.y < hit.position.y - 80):
				direction.x *= -1
				direction.y *= -1
				position.x = 155
			elif position.x > 148:
				direction.x *= -1
		"Player2":
			if (position.y > hit.position.y + 80) or (position.y < hit.position.y - 80):
				direction.x *= -1
				direction.y *= -1
				position.x = 1125
			elif position.x < 1132:
				direction.x *= -1
	speed += 20
