extends Node2D

var audiovolume = 50 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/mainmenu.tscn")


func _on_audio_value_changed(value):
	audiovolume=value


func _on_fullscreen_toggled(toggled_on):
	if get_window().mode==Window.MODE_FULLSCREEN:
		get_window().mode = Window.MODE_WINDOWED
	else:
		get_window().mode = Window.MODE_FULLSCREEN
