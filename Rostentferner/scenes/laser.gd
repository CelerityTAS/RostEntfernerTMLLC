extends Area2D
var trackedPos = []
var lastTrackedPos = []
var step = -1
@export var baseSpeed = 30
@onready var player = $"../player"
@onready var timer = $Timer
var nextMove = 0
@export var DELAY = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start():
	step = 0

func reset(hasFinished):
	if hasFinished:
		lastTrackedPos = trackedPos
	trackedPos = []
	position.x = -598
	nextMove = 0
	step = -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += nextMove*4*delta
	
	
	for body in get_overlapping_bodies():
		if body.has_method("die"):
			body.die()


func _on_timer_timeout():
	if step != -1:
		trackedPos.append(player.position.x)
		step += 1
		if step-DELAY>=0:
			if step-DELAY<lastTrackedPos.size():
				nextMove = lastTrackedPos[step-DELAY]-position.x
			else :
				nextMove = baseSpeed
	
