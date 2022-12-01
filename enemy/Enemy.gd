extends KinematicBody2D

onready var player = get_node_or_null("/root/Game/Player_Container/Player")
onready var Corpse = load("res://enemy/Corpse.tscn")
onready var Bullet = load("res://projectiles/EnemyBullet.tscn")
var Bullet_Container = null


var dead = false




func _ready():
	if player != null:
		print("hi!")

func _physics_process(_delta):
	if dead != true:
		if player != null:
			var playerloc = player.global_position
			var direction = (playerloc - self.position).normalized()
			var new_angle =  PI + atan2(direction.y, direction.x) 
			self.rotation  = new_angle

func hit():
	print("hit")
	$AnimatedSprite.set_animation("dead")
	dead = true
	$CollisionShape2D.queue_free()


func _on_Timer_timeout():
	if dead != true:
		Bullet_Container = get_node_or_null("/root/Game/Bullet_Container")
		if Bullet_Container != null:
			var bullet = Bullet.instance()
			bullet.global_position = self.position
			print(self.position)
			print(bullet.global_position)
			Bullet_Container.add_child(bullet)



func _on_Area2D_body_entered(body):
	if body.has_method("eat"):
		if dead == true:
			body.eat()
			queue_free()




