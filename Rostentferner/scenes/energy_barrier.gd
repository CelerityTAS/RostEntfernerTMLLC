extends Node2D

@export var button:Area2D
# Called when the node enters the scene tree for the first time.

func _ready():
	if active:
		$AnimatedSprite2D.play("on")
	button.ButtonPressed.connect(_on_button_button_pressed)


@export var active = true

func _on_area_2d_body_entered(body):
	if (body.name=="player"):
		if (active): get_parent().get_node("player").die()
		
func _on_button_button_pressed():
	$AnimatedSprite2D.play("off")
	$Area2D.collision_layer=8
	active=!active
