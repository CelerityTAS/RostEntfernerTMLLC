extends Node

@onready var player = get_parent().get_parent()

var next_state = self
var jumped = false
@onready var jump_buffer_timer = $"../../JumpBufferTimer"

func state_process(_delta):
	if (!Input.is_action_pressed("jump")):
		player.movement.y=0
	if (Input.is_action_pressed("left") and $"../../RightWallRayCast".is_colliding()):
		return get_parent().get_node("air")
	if (Input.is_action_pressed("right") and $"../../LeftWallRayCast".is_colliding()):
		return get_parent().get_node("air")
	if ($"../../LeftWallRayCast".is_colliding() or $"../../RightWallRayCast".is_colliding() ):
		player.jump_available=true
		return self
	else:
		return get_parent().get_node("air")
		

func end_state():
	player.jump_available=true
	$"../../CoyoteTimer".start()

func start_state():
	player.jump_available = true
	pass
