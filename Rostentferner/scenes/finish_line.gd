extends Node2D


var deaths = 0
var times_completed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	deaths=0
	times_completed=0
	$"../HUD/ColorRect".material.set_shader_parameter("activated",false)

func resetdeaths():
	deaths=0
	$"../HUD/ColorRect".material.set_shader_parameter("activated",false)

func adddeath():
	if $DeathTime.is_stopped():
		$DeathTime.start()
		deaths+=1
		if (deaths==2):
			$"../HUD/ColorRect".material.set_shader_parameter("activated",true)
		return deaths>=3
	return false


func _on_area_2d_body_entered(body):
	if (body.name=="player"):
		$"../Laser".reset(true)
		$"../player".reset()
		$"../player".isAlive = false
		$"../player".visible=false
		$InvisTimer.start()
		$Timer.start()
		times_completed+=1
	
		$"../HUD/RunCounter/RunCount".text=str(times_completed)
		pass # Replace with function body.


func _on_timer_timeout():
	$"../player".isAlive=true
	get_parent().get_node("Control").paused=true


func _on_death_time_timeout():
	pass # Replace with function body.


func _on_invis_timer_timeout():
	$"../player".visible= true
