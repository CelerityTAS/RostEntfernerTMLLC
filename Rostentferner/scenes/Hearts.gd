extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var deaths = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	deaths = $"../../Finish".deaths
	$Heart2.visible = false
	$Heart3.visible = false
	if (deaths<=1):
		$Heart2.visible=true
	if (deaths<=0):
		$Heart3.visible=true
		
