extends Node

@onready var player = get_parent().get_parent()
var next_state = null
@onready var coyote_timer = $"../../CoyoteTimer"

var speedboost = 0

func state_process(_delta):
	next_state = self
	
	
	if !player.is_on_floor():
		next_state = get_parent().get_node("air")
		if coyote_timer.is_stopped():
			coyote_timer.start(player.MAX_COYOTE_TIMER)
			
	else:
		coyote_timer.stop()
		player.jump_available = true
		
	if (player.movement.x>=424 and speedboost < 100):
		speedboost+=1
	if ((player.movement.x>=424 and player.direction_input()<=0) or next_state!=self):
		speedboost=0
		
	player.movement.x += player.direction_input()*player.SPEED
	player.movement.x *= player.DRAG
	player.movement.x += speedboost
	
	return next_state

func jump():
	player.movement.y += player.JUMP_VELOCITY

func end_state():
	pass



func start_state():
	pass
