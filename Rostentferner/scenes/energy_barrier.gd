extends Node2D

@export var button:Area2D
# Called when the node enters the scene tree for the first time.

func _ready():
	if active:
		$"Area2D/AnimatedSprite2D".play("default")
	button.ButtonPressed.connect(_on_button_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@export var active = true
func _on_area_2d_body_entered(body):
	if (body.name=="player"):
		if (active): get_parent().get_node("player").die()
		
func _on_button_button_pressed():
	$AnimatedSprite2D.play("default")
	self.collision_layer=8
	active=!active
