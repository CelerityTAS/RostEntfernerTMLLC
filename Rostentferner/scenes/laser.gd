extends Area2D
@onready var colission = $Collision
var trackedPos = []
var lastTrackedPos = []
@onready var player = $"../player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	trackedPos.append(player.poaition.x)
