extends CharacterBody2D


const SPEED = 150.0

var idle_anims = ["Scout-Idle","Mage-Idle","Archer-Idle","Knight-Idle"]
var move_anims = ["Scout-Move","Mage-Move","Archer-Move","Knight-Move"]

var idle
var move

var player: CharacterBody2D
var sprite: AnimatedSprite2D
var spawner: Node2D

func _ready() -> void:
	player = get_node("/root/Game/Warlock")
	sprite = get_child(0)
	spawner = get_node("/root/Game/Undead Spawner/")
	position = spawner.global_position
	add_to_group("enemies")
	
	# Enemy Type (Animations)
	
	# Random Number Between 0 and 3
	var index = randi() % 4
	
	idle = idle_anims[index]
	move = move_anims[index]

func _physics_process(delta: float) -> void:
	var direction := (player.global_position - global_position).normalized()
	velocity = direction * SPEED
	
	# Look at player
	var x_dir = direction.x
	if(x_dir < 0):
		sprite.flip_h = true
	if(x_dir > 0):
		sprite.flip_h = false
	
	# Animations
	if(velocity.length() == 0):
		sprite.play(idle)
	else:
		sprite.play(move)
	

	move_and_slide()
