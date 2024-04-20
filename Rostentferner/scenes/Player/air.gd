extends Node

@onready var player = get_parent().get_parent()
var next_state = null

func state_process(_delta):
	next_state = self
	player.movement.x *= player.DRAG
	
	if player.is_on_floor():
		next_state = get_parent().get_node("normal")
	player.movement.x += player.direction_input()*player.SPEED
	
	return next_state

func end_state():
	pass



func start_state():
	pass

