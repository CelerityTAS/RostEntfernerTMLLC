extends Node

@onready var player = get_parent().get_parent()
var next_state = null
@onready var right_wall_ray_cast = $"../../RightWallRayCast"
@onready var left_wall_ray_cast = $"../../LeftWallRayCast"

func state_process(_delta):
	next_state = self
	
	if player.is_on_floor():
		next_state = get_parent().get_node("normal")
		
	if left_wall_ray_cast.is_colliding() or right_wall_ray_cast.is_colliding():
		next_state=get_parent().get_node("wall")
		
	player.movement.x += player.direction_input()*player.SPEED
	player.movement.x *= player.DRAG
	
	return next_state

func end_state():
	pass



func start_state():
	pass

