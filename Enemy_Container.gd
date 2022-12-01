extends Node2D

onready var Enemy = load("res://enemy/Enemy.tscn")

var spawn_locations = [
	Vector2(0,0),
	Vector2(-500, -450),
	Vector2(330, 450),
	Vector2(490, 420),
	Vector2(-600, 600)
]

var spawn_time = 5.0
var last_spawn = 2

func _on_Spawn_Timer_timeout():
	# Picking a random spawn location
	var has_spawned = false
	var location = Vector2.ZERO
	while not has_spawned:
		var random = randi() % 5
		if random != last_spawn:
#			print(random)
			location = spawn_locations[random]
			has_spawned = true
			last_spawn = random
#		else:
#			print("repicking location")
	
	# Spawning in the enemy
	var enemy = Enemy.instance()
	enemy.global_position = location
	add_child(enemy)
	
	# Resetting the timer, now with less time
	if spawn_time > 1.0:
		spawn_time *= 0.95
	$Spawn_Timer.wait_time = spawn_time
	$Spawn_Timer.start()
