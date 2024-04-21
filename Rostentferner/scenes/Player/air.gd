extends Node

@onready var player = get_parent().get_parent()
var next_state = null
@onready var right_wall_ray_cast = $"../../RightWallRayCast"
@onready var left_wall_ray_cast = $"../../LeftWallRayCast"
@onready var right_wall_ray_cast_2 = $"../../RightWallRayCast2"
@onready var left_wall_ray_cast_2 = $"../../LeftWallRayCast2"

func state_process(_delta):
	next_state = self
	
	if player.is_on_floor():
		next_state = get_parent().get_node("normal")
		
	if left_wall_ray_cast.is_colliding() and !(player.movement.x >0) or right_wall_ray_cast.is_colliding()and !(player.movement.x <0):
		next_state=get_parent().get_node("wall")
		
	if $"../../LockedTimer".is_stopped():
		player.movement.x += player.direction_input()*player.SPEED
		player.movement.x *= player.DRAG
	else:
		if player.movement.x>0 and player.direction_input()> 0:
			player.movement.x += player.direction_input()*player.SPEED
			player.movement.x *= player.DRAG
		if player.movement.x<0 and player.direction_input()< 0:
			player.movement.x += player.direction_input()*player.SPEED
			player.movement.x *= player.DRAG
	
	return next_state

func jump():
	if $"../../LockedTimer".is_stopped():
		player.movement.y += player.JUMP_VELOCITY

func end_state():
	pass



func start_state():
	pass

