extends StaticBody2D

@export var open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	return #TODO: sprite
	if (open):
		$OpenSprite.draw()
	else:
		$ClosedSprite.draw()

func _on_button_button_pressed():
	print("Opened Door")
	self.collision_layer=10
	open = !open
