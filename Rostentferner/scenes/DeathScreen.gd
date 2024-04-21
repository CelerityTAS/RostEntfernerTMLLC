extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false
	$"../DeathScreenBlur".visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_deathscreen():
	visible=true
	$"../DeathScreenBlur".visible=true
	$HBoxContainer/RunCount.text=$"../RunCounter/RunCount".text

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_button_pressed():
	get_tree().quit()


func _on_return_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/mainmenu.tscn")
