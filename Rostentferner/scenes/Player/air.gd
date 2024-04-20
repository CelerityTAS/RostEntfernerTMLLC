extends Node

@onready var player = get_parent().get_parent()
var next_state = null

func state_process(_delta):
	next_state = self
	
	if player.is_on_floor():
		next_state = get_parent().get_node("normal")
	var direction = player.direction_input()
	if direction == 0:
		player.movement.x = move_toward(player.velocity.x, 0, player.DECELERATION)
	else:
		player.movement.x = move_toward(player.velocity.x, direction * player.TERMINAL_SPEED, player.ACCELERATION)
	
	return next_state

func end_state():
	pass



func start_state():
	pass

