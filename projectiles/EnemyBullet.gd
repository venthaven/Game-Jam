extends KinematicBody2D

onready var player = get_node_or_null("/root/Game/Player_Container/Player")

var velocity = Vector2.ZERO
var speed = 1000

var damage = 10

func _ready():
	if player != null:
		var target = player.global_position
#		print(target)
		var direction = (target - self.position).normalized()
		var new_angle =  PI/2 + atan2(direction.y, direction.x) 
		velocity = Vector2(0,-speed).rotated(new_angle)

func _physics_process(_delta):
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.has_method("ouch"):
			collision.collider.ouch(-damage)
		if collision.collider.has_method("hit"):
			pass
		else:
			queue_free()
