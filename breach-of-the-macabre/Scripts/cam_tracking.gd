extends TextureRect

var x_bounds = [452, 8904]
var y_bounds = [280, 4898]

var cam: Camera2D
var isIn: bool
var player: CharacterBody2D

const tracking_xSpan = 4226 #(background size.x - 2(cutoff length)) / 2
const tracking_ySpan = 2309 #(background size.y - 2(cutoff length)) / 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	player = get_node("/root/Game/Warlock/")
	cam = player.get_child(2)

func _process(delta: float) -> void:
	var x_dist = abs((position.x - 608) - player.position.x)
	var y_dist = abs((position.y - 695) - player.position.y)
	
	if(x_dist > tracking_xSpan):
		cam.drag_horizontal_enabled = true
	elif (x_dist < tracking_xSpan):
		cam.drag_horizontal_enabled = false
		
	if(y_dist > tracking_ySpan):
		cam.drag_vertical_enabled = true
	elif (y_dist < tracking_ySpan):
		cam.drag_vertical_enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	if (body.name == "Warlock"):
		isIn = true

func _on_body_exited(body):
	if (body.name == "Warlock"):
		isIn = false
