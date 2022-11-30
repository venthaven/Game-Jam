extends Node


var hunger = 100

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if hunger <= 0:
		var _target = get_tree().change_scene("res://menus/Death Screen.tscn")
