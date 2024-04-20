extends CharacterBody2D



const UP_VECTOR = Vector2(0,-1)

@export var SPEED = 100.0
@export var JUMP_VELOCITY = -400.0
@export var MAX_JUMP_TIMER = 11
@export var MAX_COYOTE_TIMER = 0.1 #in Sec
@export var DRAG = 0.8
@export var GRAVITY = 1000
@onready var sprite = $AnimatedSprite2D
var jump_available = false
var movement = Vector2()


func _physics_process(delta):
	if Input.is_action_pressed("jump") and jump_available:
		movement.y = JUMP_VELOCITY
		jump_available = false
	
	set_velocity(movement)
	set_up_direction(UP_VECTOR)
	move_and_slide()
	movement = velocity


func direction_input():
	var direction_temp = 0
	if Input.is_action_pressed("left"):
		direction_temp -= 1
	
	if Input.is_action_pressed("right"):
		direction_temp += 1
	return direction_temp
