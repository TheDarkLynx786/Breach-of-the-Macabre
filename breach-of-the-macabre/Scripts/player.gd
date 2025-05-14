extends CharacterBody2D


const speed = 300.0
const distBound_x = 4680
const distBound_y = 2592

var sprite: AnimatedSprite2D
var cam: Camera2D
var in_dir

func _ready() -> void:
	sprite = get_child(0)

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	
	var x_dir = input_direction.x
	var y_dir = input_direction.y
	
	#Direction-Facing
	if(x_dir < 0):
		sprite.flip_h = true
	if(x_dir > 0):
		sprite.flip_h = false
	
	#Animations
	if(velocity.length() == 0):
		sprite.play("idle")
	else:
		sprite.play("move")


func _physics_process(delta):
	get_input()
	move_and_slide()
