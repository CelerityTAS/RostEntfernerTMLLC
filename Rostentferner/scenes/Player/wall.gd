extends Node

@onready var player = get_parent().get_parent()

var next_state = self

func state_process(_delta):
	next_state = self
	if player.is_on_floor():
		return $"../normal"
	player.jump_available=true
	if player.movement.y > 0:
		if (Input.is_action_pressed("right") and $"../../RightWallRayCast".is_colliding()) or (Input.is_action_pressed("left") and $"../../LeftWallRayCast".is_colliding()):
			player.movement.y*=0.7
	if (Input.is_action_pressed("left") and $"../../RightWallRayCast".is_colliding()):
		$"../../CoyoteTimer".start(player.MAX_COYOTE_TIMER)
		return get_parent().get_node("air")
	if (Input.is_action_pressed("right") and $"../../LeftWallRayCast".is_colliding()):
		$"../../CoyoteTimer".start(player.MAX_COYOTE_TIMER)
		return get_parent().get_node("air")
	if !$"../../RightWallRayCast".is_colliding() and !$"../../LeftWallRayCast".is_colliding():
		return $"../air"
	
	if !$"../../RightWallRayCast2".is_colliding() and $"../../RightWallRayCast".is_colliding():
		next_state = $"../hanging"
	if !$"../../LeftWallRayCast2".is_colliding() and $"../../LeftWallRayCast".is_colliding():
		next_state = $"../hanging"
	
	return next_state
		

func jump():
	if $"../../LockedTimer".is_stopped():
		player.movement.y = player.JUMP_VELOCITY*0.85
	if $"../../RightWallRayCast".is_colliding():
		player.movement.x = -200
	else:
		player.movement.x = 200
	$"../../LockedTimer".start()

func end_state():
	pass

func start_state():
	pass
