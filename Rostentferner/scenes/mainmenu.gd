extends CanvasLayer


func _on_start_pressed():
	get_tree().change_scene_to_file("scenes/game.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/optionen.tscn")
