extends Node2D


var deaths = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	deaths=0

func resetdeaths():
	deaths=0

func adddeath():
	deaths+=1
	return deaths>=3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	resetdeaths()
	pass # Replace with function body.
