extends StaticBody2D

@export var open = false
@export var button:Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if open:
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.material.set_shader_parameter("activated",true)
		self.collision_layer=8
	button.ButtonPressed.connect(_on_button_button_pressed)
	$AnimatedSprite2D.material.set_shader_parameter("activated",false)
	

func _on_button_button_pressed():
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.material.set_shader_parameter("activated",true)
	$Open.material.set_shader_parameter("activated",true)
	self.collision_layer=8
	open = !open


func _on_animated_sprite_2d_animation_finished():
	$Open.visible = true
