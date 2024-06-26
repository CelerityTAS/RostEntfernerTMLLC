extends Node2D

var audiovolume = 50 

func _ready():
	audiovolume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))*2+50
	$optionencontainer/VBoxContainer/HBoxContainer/audio.value = audiovolume

func _on_close_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/mainmenu.tscn")


func _on_audio_value_changed(value):
	audiovolume=value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), (value-50)/2)


func _on_fullscreen_toggled(toggled_on):
	if get_window().mode==Window.MODE_FULLSCREEN:
		get_window().mode = Window.MODE_WINDOWED
	else:
		get_window().mode = Window.MODE_FULLSCREEN
