extends StaticBody2D

@export var open = false
@export var button:Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	button.ButtonPressed.connect(_on_button_button_pressed)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_button_pressed():
	$AnimatedSprite2D.play("default")
	self.collision_layer=8
	open = !open
