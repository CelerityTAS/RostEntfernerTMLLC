extends Node

@onready var player = get_parent().get_parent()
var next_state = null
var coyoteTimeout = false
@onready var coyote_timer = $"../../CoyoteTimer"

func state_process(_delta):
	if coyoteTimeout:
		coyoteTimeout = false
		next_state = get_parent().get_node("air")
	else: 
		next_state = self
	
	player.movement.x *= player.DRAG
	
	if !player.is_on_floor():
		next_state = get_parent().get_node("air")
		if coyote_timer.is_stopped():
			coyote_timer.start(player.MAX_COYOTE_TIMER)
			
	else:
		coyote_timer.stop()
		player.jump_available = true
		
	player.movement.x += player.direction_input()*player.SPEED
	
	return next_state

func end_state():
	pass



func start_state():
	pass



func _on_coyote_timer_timeout():
	player.jump_available = false
