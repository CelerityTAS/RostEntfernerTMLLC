extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal ButtonPressed

var pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _draw():
	return # TODO: Sprite add
	if pressed:
		$OpenSprite.draw()
	else: $ClosedSprite.draw()


func _on_body_entered(body):
	pressed=true
	ButtonPressed.emit()