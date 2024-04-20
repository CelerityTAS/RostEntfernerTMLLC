extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@export var active = true

func _on_area_2d_body_entered(body):
	if (body.name=="player"):
		if (active): get_parent().get_node("player").die()
