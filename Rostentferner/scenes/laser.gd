extends Area2D
var trackedPos = []
var lastTrackedPos = []
var step = 0
@export var baseSpeed = 30
@onready var player = $"../player"
@onready var timer = $Timer
var nextMove = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset():
	lastTrackedPos = trackedPos
	position.x = -598
	step = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += nextMove*4*delta
	
	
	for body in get_overlapping_bodies():
		if body.has_method("die"):
			body.die()


func _on_timer_timeout():
	trackedPos.append(player.position.x)
	step += 1
	if step<lastTrackedPos.size():
		nextMove = lastTrackedPos[step]-position.x
	else:
		nextMove = baseSpeed
	
