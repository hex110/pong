extends Node

var points = 0

func modifyPoints(inc):
	if inc == -1:
		points = 0
	else:
		points = points + inc

func _physics_process(_delta):
	get_child(3).get_child(0).text = "Points: " + str(points)

func restart():
	get_child(1).speed = 300
	get_child(1).position.x = 640
	get_child(1).position.y = 360
	get_child(1).pickDirection()

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

