extends Control

@onready var player = $"../player"
var paused = true
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if paused and abs(player.movement.x) > 5:
		$"../Laser".start()
		paused = false
	if Input.is_action_just_pressed("ui_accept"):
		$"../Laser".reset(false)
		player.reset()
		paused = true
