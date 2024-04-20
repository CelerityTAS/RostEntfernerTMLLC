extends Node

@onready var player = get_parent().get_parent()
var next_state = null

func state_process(_delta):
	next_state=self


	return next_state

func end_state():
	pass



func start_state():
	pass
