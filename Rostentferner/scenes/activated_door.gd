extends StaticBody2D

@export var open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_button_pressed():
	$AnimatedSprite2D.play("default")
	self.collision_layer=8
	open = !open
