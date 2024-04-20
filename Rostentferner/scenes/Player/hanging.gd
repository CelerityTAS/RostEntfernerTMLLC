extends Node

@onready var player = get_parent().get_parent()

var next_state = self

func state_process(_delta):
	next_state = self
	if player.is_on_floor():
		return $"../normal"
	player.jump_available=true
	if player.movement.y > 0:
		player.movement.y*=0.7
	if (Input.is_action_pressed("left") and $"../../RightWallRayCast".is_colliding()):
		$"../../CoyoteTimer".start()
		return get_parent().get_node("air")
	if (Input.is_action_pressed("right") and $"../../LeftWallRayCast".is_colliding()):
		$"../../CoyoteTimer".start()
		return get_parent().get_node("air")
	if !$"../../RightWallRayCast".is_colliding() and !$"../../LeftWallRayCast".is_colliding():
		return $"../air"
	
	if $"../../RightWallRayCast2".is_colliding() and $"../../RightWallRayCast".is_colliding():
		next_state = $"../wall"
	if $"../../LeftWallRayCast".is_colliding() and $"../../LeftWallRayCast2".is_colliding():
		next_state = $"../wall"
	
	return next_state
		

func jump():
	player.movement.y = player.JUMP_VELOCITY
	

func end_state():
	pass

func start_state():
	pass
