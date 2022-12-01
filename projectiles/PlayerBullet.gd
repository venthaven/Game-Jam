extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 1000

func _ready():
	
	var mouse = get_global_mouse_position()
	var direction = (mouse - self.position).normalized()
	var new_angle =  PI/2 + atan2(direction.y, direction.x) 
	velocity = Vector2(0,-speed).rotated(new_angle)

func _physics_process(_delta):
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
#		print("I collided with ", collision.collider.name)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
		queue_free()






func _on_Area2D_area_entered(_area):
	pass


func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit()
		queue_free()
	

