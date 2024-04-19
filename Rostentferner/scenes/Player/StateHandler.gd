extends Node

@onready var current_state = $normal
@onready var next_state = $normal
@onready var player = get_parent()

@onready var coyoteTimer = player.MAX_COYOTE_TIMER

func _process(delta):
		
		set_animation()
		next_state = current_state.state_process(delta)
		if current_state != next_state:
			if coyoteTimer <= 0:
				current_state.end_state()
				current_state = next_state
				current_state.start_state()
			coyoteTimer -= 1
		else:
			coyoteTimer = player.MAX_COYOTE_TIMER

func play_transition(transition_name):
	player.sprite.play(transition_name)

func set_animation():
	if get_parent().movement.x > 0:
		get_parent().sprite.flip_h = true
		

	if get_parent().movement.x <= 0:
		get_parent().sprite.flip_h = false
	#if current_state.name == "normal":
		#get_parent().sprite.play("walk")
	#elif current_state.name == "air":
		#get_parent().sprite.play("air")
	#
	#elif current_state.name == "wall":
		#get_parent().sprite.play("climb")
