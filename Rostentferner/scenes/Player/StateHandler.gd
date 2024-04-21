extends Node

@onready var current_state = $normal
@onready var next_state = $normal
@onready var player = get_parent()
@onready var animated_sprite_2d = $"../AnimatedSprite2D"


func _process(delta):
		player.movement.y += player.GRAVITY * delta
		set_animation()
		next_state = current_state.state_process(delta)
		if current_state != next_state:
			current_state.end_state()
			current_state = next_state
			current_state.start_state()


func play_transition(transition_name):
	player.sprite.play(transition_name)

func set_animation():
	if player.movement.x < 0:
		player.sprite.flip_h = true
	if player.movement.x > 0:
		player.sprite.flip_h = false
	if animated_sprite_2d.animation == "die":
		pass
	elif current_state.name == "air":
		player.sprite.play("run")
	elif current_state.name == "normal":
		if abs(player.movement.x) > 10:
			player.sprite.play("run")
		else:
			player.sprite.play("idle")
	elif current_state.name == "wall" or current_state.name == "hanging":
		player.sprite.play("hanging")
		if $"../RightWallRayCast".is_colliding():
			player.sprite.flip_h = true
		if $"../LeftWallRayCast".is_colliding():
			player.sprite.flip_h = false

