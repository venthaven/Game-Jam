extends KinematicBody2D

onready var Corpse = load("res://enemy/Corpse.tscn")

var dead = false

func _ready():
	pass

func hit():
	print("hit")
	$AnimatedSprite.set_animation("dead")
	dead = true
	$CollisionShape2D.queue_free()





func _on_Area2D_body_entered(body):
	if body.has_method("eat"):
		if dead == true:
			body.eat()
			queue_free()
