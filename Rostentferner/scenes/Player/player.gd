extends CharacterBody2D



const UP_VECTOR = Vector2(0,-1)

@export var SPEED = 50
@export var JUMP_VELOCITY = -400.0
@export var MAX_JUMP_TIMER = 11
@export var MAX_COYOTE_TIMER = 0.1 #in Sec
@export var DRAG = 0.9
@export var GRAVITY = 1000
@onready var sprite = $AnimatedSprite2D
var jump_available = false
var movement = Vector2()


func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		$JumpBufferTimer.start()
	if Input.is_action_just_released("jump"):
		$JumpBufferTimer.stop()
	
	if (!$StateHandler.current_state==$wall):
		if !$JumpBufferTimer.is_stopped() and jump_available:
			movement.y = JUMP_VELOCITY
			jump_available = false
		if !Input.is_action_pressed("jump") and movement.y < 0:
			movement.y *= 0.7
	
	set_velocity(movement)
	set_up_direction(UP_VECTOR)
	move_and_slide()
	movement = velocity

func die():
	get_tree().change_scene_to_file("res://scenes/menus/mainmenu.tscn")

func direction_input():
	var direction_temp = 0
	if Input.is_action_pressed("left"):
		direction_temp -= 1
	
	if Input.is_action_pressed("right"):
		direction_temp += 1
	return direction_temp
