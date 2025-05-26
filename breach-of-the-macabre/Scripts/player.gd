extends CharacterBody2D


const speed = 300.0
const max_health = 96
const min_health = 18
const health_step = 8


var sprite: AnimatedSprite2D
var cam: Camera2D
var enemy: CharacterBody2D
var health_bar: TextureProgressBar
var hurtbox: Area2D
var health: int

func _ready() -> void:
	sprite = get_child(0)
	hurtbox = get_child(3)
	enemy = get_node("/root/Game/Undead/")
	health_bar = get_node("/root/Game/UI/Control/").get_child(0)
	health = health_bar.max_value
	add_to_group("player")
	
	print(hurtbox)
	print(health_bar)
	print(enemy)

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed
	
	var x_dir = input_direction.x
	var y_dir = input_direction.y
	
	# Direction-Facing
	if(x_dir < 0):
		sprite.flip_h = true
	if(x_dir > 0):
		sprite.flip_h = false
	
	# Animations
	if(velocity.length() == 0):
		sprite.play("idle")
	else:
		sprite.play("move")
	

func _physics_process(delta):
	get_input()
	move_and_slide()
	


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		print("Damage Taken!")
		health -= health_step
		health_bar.value = health
		print(health)
