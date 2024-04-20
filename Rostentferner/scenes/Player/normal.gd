extends Node

@onready var player = get_parent().get_parent()
var next_state = null
@onready var coyote_timer = $"../../CoyoteTimer"

func state_process(_delta):
	if coyote_timer.is_stopped():
		next_state = get_parent().get_node("air")
	else: 
		next_state = self
	
	
	if !player.is_on_floor():
		next_state = get_parent().get_node("air")
		if coyote_timer.is_stopped():
			coyote_timer.start(player.MAX_COYOTE_TIMER)
			
	else:
		coyote_timer.stop()
		player.jump_available = true
		
	player.movement.x += player.direction_input()*player.SPEED
	player.movement.x *= player.DRAG
	
	return next_state

func end_state():
	pass



func start_state():
	pass
