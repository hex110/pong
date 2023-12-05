extends Node

var points = 0

func modifyPoints(inc):
	points = points + inc

func _physics_process(_delta):
	get_child(3).get_child(0).text = "Points: " + str(points)

func restart():
	get_child(1).speed = 300
	get_child(1).position.x = 640
	get_child(1).position.y = 360
	get_child(1).pickDirection()
	points = 0
