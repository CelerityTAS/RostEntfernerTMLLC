extends CharacterBody2D



const UP_VECTOR = Vector2(0,-1)

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var MAX_JUMP_TIMER = 11
@export var MAX_COYOTE_TIMER = 3
@export var ACCELERATION = 20
@export var DECELERATION = 100
@export var TERMINAL_SPEED = 500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
var movement = Vector2()


func _physics_process(delta):
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
