extends Area2D

signal ButtonPressed
var pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _ready():
	$Sprite2D.material.set_shader_parameter("activated",false)

func _on_body_entered(body):
	if body.name=="player":
		$Sprite2D.material.set_shader_parameter("activated",true)
		if !pressed:
			pressed=true
			ButtonPressed.emit()
