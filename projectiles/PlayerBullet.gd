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






func _on_Area2D_area_entered(area):
	pass


func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		queue_free()
	

