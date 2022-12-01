extends Control

func _ready():
	pass

func _physics_process(_delta):
	$Score.text = "Score: " + str(Global.score)
	$FoodBar.value = Global.hunger
	


func _on_FoodBar_value_changed(_value):
	$FoodBar.get("custom_styles/fg").set_bg_color(Color8(55 + 2 * Global.hunger, 0, 0))
