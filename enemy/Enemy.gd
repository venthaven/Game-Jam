extends KinematicBody2D

onready var player = get_node_or_null("/root/Game/Player_Container/Player")
onready var Corpse = load("res://enemy/Corpse.tscn")
onready var Bullet = load("res://projectiles/EnemyBullet.tscn")
var Bullet_Container = null



var dead = false

onready var ray = $RayCast2D
export var speed = 25
export var looking_speed = 25
var line_of_sight = false
var points = []
const margin = 1.5


func _ready():
	if player != null:
		#print("hi!")
		pass

func _physics_process(_delta):
	if dead != true:
		if player != null:
			var playerloc = player.global_position
			var direction = (playerloc - self.position).normalized()
			var new_angle =  PI + atan2(direction.y, direction.x) 
			self.rotation  = new_angle
			var velocity = Vector2.ZERO
			ray.cast_to = ray.to_local(player.global_position)
			var c = ray.get_collider()
#			print(c)
			line_of_sight = false
			if c and c.name == "Player":
				line_of_sight = true
			points = get_node("/root/Game/Navigation2D").get_simple_path(get_global_position(), player.global_position, true)
			if points.size() > 1:
				var distance = points[1] - get_global_position()
				var movedirection = distance.normalized()
				if distance.length() > margin or points.size() > 2:
						velocity = movedirection*speed
				else:
					velocity = Vector2(0, 0)
				var _v = move_and_slide(velocity, Vector2(0,0))
			update()

func hit():
#	print("hit")
	$AnimatedSprite.set_animation("dead")
	dead = true
	$CollisionShape2D.queue_free()


func _on_Timer_timeout():
	if dead != true and line_of_sight == true:
		Bullet_Container = get_node_or_null("/root/Game/Bullet_Container")
		if Bullet_Container != null:
			var bullet = Bullet.instance()
			bullet.global_position = self.position
#			print(self.position)
#			print(bullet.global_position)
			Bullet_Container.add_child(bullet)



func _on_Area2D_body_entered(body):
	if body.has_method("eat"):
		if dead == true:
			body.eat()
			queue_free()




