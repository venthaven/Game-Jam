extends KinematicBody2D

onready var speed = 200
onready var Bullet = load("res://projectiles/PlayerBullet.tscn")
var Bullet_Container = null


func _ready():
	pass

func _physics_process(_delta):
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
	var _v = move_and_slide(input_direction * speed)
	var mouse = get_global_mouse_position()
	var direction = (mouse - self.position).normalized()
	var new_angle =  PI + atan2(direction.y, direction.x) 
	self.rotation  = new_angle
	if Input.is_action_just_pressed("shoot"):
		Bullet_Container = get_node_or_null("/root/Game/Bullet_Container")
		if Bullet_Container != null:
#			print("shoot")
			var bullet = Bullet.instance()
			bullet.global_position = self.position
			Bullet_Container.add_child(bullet)

func eat():
	Global.hunger_change(5)

func ouch(damage):
	Global.hunger_change(damage)



func _on_Timer_timeout():
	Global.hunger_change(-1)
	Global.score_increase(1)
#	
#	print(Global.hunger)
#	Global.score += 1
#	print(Global.score)
	
