extends KinematicBody2D


func _ready():
	pass



func _on_Timer_timeout():
	Global.hunger -= 1
	print(Global.hunger)
	Global.score += 1
	print(Global.hunger)
