extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 1000

func _ready():
	
	var mouse = get_global_mouse_position()
	var direction = (mouse - self.position).normalized()
	var new_angle =  PI/2 + atan2(direction.y, direction.x) 
	velocity = Vector2(0,-speed).rotated(new_angle)

func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector2.ZERO)
