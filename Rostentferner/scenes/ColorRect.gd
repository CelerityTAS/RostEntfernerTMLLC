extends ColorRect


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var disttoplayer = 1-(abs($"../../player".position.x - $"../../Laser".position.x))/864
	material.set_shader_parameter("distancetoplayer",disttoplayer)
	pass
