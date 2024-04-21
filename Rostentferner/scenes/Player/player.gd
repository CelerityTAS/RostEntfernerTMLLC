extends CharacterBody2D



const UP_VECTOR = Vector2(0,-1)

@export var SPEED = 50
@export var JUMP_VELOCITY = -400.0
@export var MAX_JUMP_TIMER = 11
@export var MAX_COYOTE_TIMER = 0.1 #in Sec
@export var DRAG = 0.9
@export var GRAVITY = 1000
@onready var sprite = $AnimatedSprite2D
var isAlive = true
var jump_available = false
var movement = Vector2()


func _physics_process(_delta):
	if (!isAlive or $AnimatedSprite2D.animation=="die"): return
	if Input.is_action_just_pressed("jump"):
		$JumpBufferTimer.start()
	if Input.is_action_just_released("jump"):
		$JumpBufferTimer.stop()
	if !Input.is_action_pressed("jump") and movement.y < 0:
		movement.y *= 0.7
	
	if !$JumpBufferTimer.is_stopped() and jump_available:
		$StateHandler.current_state.jump()
		jump_available = false
		$JumpBufferTimer.stop()
		
	
	set_velocity(movement)
	set_up_direction(UP_VECTOR)
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().has_meta("box"):
			collision.get_collider().apply_central_impulse(-collision.get_normal() * 100)
	movement = velocity

func die():
	if $DeathTime.is_stopped():
		$DeathTime.start()
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.play("die")
		$AudioStreamPlayer.play()
		isAlive=false


func direction_input():
	if !isAlive:return 0
	var direction_temp = 0
	if Input.is_action_pressed("left"):
		direction_temp -= 1
	
	if Input.is_action_pressed("right"):
		direction_temp += 1
	return direction_temp

func reset():
	movement = Vector2(0,0)
	position = Vector2(-562,197)
	isAlive = true
	visible=true
	$AnimatedSprite2D.play("idle")


func _on_coyote_timer_timeout():
	jump_available = false


func _on_locked_timer_timeout():
	jump_available = false


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "die":
		$AnimatedSprite2D.play("idle")
		if (get_parent().get_node("Finish").adddeath()):
			$"../HUD/DeathScreen".show_deathscreen()
			visible=false
		else:
			visible=false
			get_parent().get_node("Control").paused=true
			get_parent().get_node("Laser").reset(false)
			reset()
