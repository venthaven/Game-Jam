extends Node2D

onready var Player = load("res://Player/Player.tscn")
var starting_position = Vector2(200,200)


func _ready():
	pass


func _physics_process(_delta):
	$Player.get_node("Camera2D").current = true
