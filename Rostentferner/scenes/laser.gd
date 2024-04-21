extends Area2D
var trackedPos = []
var lastTrackedPos = []
var step = -1
var replayStep = 0
@export var baseSpeed = 30
@onready var player = $"../player"
@onready var timer = $Timer
@onready var replay_timer = $replayTimer

var nextMove = 0
@export var delay = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

func start():
	step = 0
	replayStep = 0

func reset(hasFinished):
	if hasFinished:
		lastTrackedPos = trackedPos
		replay_timer.wait_time = 0.25*(lastTrackedPos.size() )/(lastTrackedPos.size()+ delay*1.0)
	trackedPos = []
	position.x = -598
	nextMove = 0
	step = -1
	replayStep = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += nextMove*4*delta
	
	
	for body in get_overlapping_bodies():
		if body.has_method("die") and body.isAlive:
			body.die()


func _on_timer_timeout():
	if step != -1:
		trackedPos.append(player.position.x)
		step += 1


func _on_replay_timer_timeout():
	if step != -1:
		replayStep += 1
		if replayStep-delay>=0:
			if replayStep-delay<lastTrackedPos.size():
				nextMove = lastTrackedPos[replayStep-delay]-position.x
			else :
				nextMove = baseSpeed
		
