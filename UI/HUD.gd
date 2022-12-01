extends Control

func _ready():
	pass

func _physics_process(_delta):
	$Score.text = "Score: " + str(Global.score)
	$FoodBar.value = Global.hunger
	


func _on_FoodBar_value_changed(value):
#	$FoodBar.theme_overrides.fg.bg_color = Vector3(100,0,0)
	pass
