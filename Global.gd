extends Node

var hunger = 100

var score = 0

func _ready():
	randomize()

func hunger_change(amount):
	hunger += amount
	if hunger > 100:
		hunger = 100
#	print(hunger)

func score_increase(amount):
	score += amount
#	print(score)

func _physics_process(_delta):
	if hunger <= 0:
		var _scene = get_tree().change_scene("res://UI/EndGame.tscn")
