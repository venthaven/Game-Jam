extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 500.0

func _ready():
	
	var mouse = get_viewport().get_mouse_position()
	var direction = (mouse - self.position).normalized()
	var new_angle =  PI + atan2(direction.y, direction.x) 
	velocity = Vector2(0,-speed).rotated(new_angle)

func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector2.ZERO)
