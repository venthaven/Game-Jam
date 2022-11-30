extends KinematicBody2D

onready var speed = 200

func _ready():
	pass

func _physics_process(delta):
	var input_direction = Vector2.ZERO
	if Input.is_action_pressed("right"):
		input_direction.x += 1
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
	if Input.is_action_pressed("down"):
		input_direction.y += 1
	if Input.is_action_pressed("up"):
		input_direction.y -= 1
	input_direction = input_direction.normalized()
	move_and_slide(input_direction * speed)
	var mouse = get_viewport().get_mouse_position()
	var direction = (mouse - self.position).normalized()
	var new_angle =  PI + atan2(direction.y, direction.x) 
	self.rotation  = new_angle




func _on_Timer_timeout():
	Global.hunger -= 1
	print(Global.hunger)
	Global.score += 1
	print(Global.score)
	
