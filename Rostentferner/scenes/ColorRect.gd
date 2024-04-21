extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var disttoplayer = 1-(abs($"../../player".position.x - $"../../Laser".position.x))/864
	material.set_shader_parameter("distancetoplayer",disttoplayer)
	pass
