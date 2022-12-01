extends Control

func _ready():
	$FinalScore.text = "Your score was " + str(Global.score)
	get_tree().paused = true
	

func _on_PlayAgain_pressed():
	get_tree().paused = false
	Global.hunger = 100
	Global.score = 0
	var _scene = get_tree().change_scene("res://UI/Main Menu/menu.tscn")

func _on_Quit_pressed():
	get_tree().quit()

