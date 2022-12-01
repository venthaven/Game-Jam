extends KinematicBody2D

onready var Corpse = load("res://enemy/Corpse.tscn")
var Enemy_Container = null

var dead = false

func _ready():
	pass

func hit():
	print("hit")
	Enemy_Container = get_node_or_null("/root/Game/Bullet_Container")
	if Enemy_Container != null:
		var corpse = Corpse.instance()
		corpse.global_position = self.position
		Enemy_Container.add_child(corpse)
	queue_free()
