extends Control

func _ready():
	$FinalScore.text = "Your score was " + str(Global.score)

func _on_PlayAgain_pressed():
	var _scene = get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()

