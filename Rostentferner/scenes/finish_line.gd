extends Node2D


var deaths = 0
var times_completed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	deaths=0
	times_completed=0

func resetdeaths():
	deaths=0

func adddeath():
	deaths+=1
	return deaths>=3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	get_parent().get_node("Laser").reset()
	$"../player".reset()
	get_parent().get_node("Control").paused=true
	resetdeaths()
	times_completed+=1
	
	$"../HUD/RunCounter/RunCount".text=str(times_completed)
	pass # Replace with function body.
