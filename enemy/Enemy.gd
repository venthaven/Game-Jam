extends KinematicBody2D

var dead = false

func _ready():
	pass

func hit():
	print("hit")
	queue_free()
