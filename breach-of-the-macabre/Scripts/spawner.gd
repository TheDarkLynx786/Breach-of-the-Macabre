extends Node2D

var enemy_scene = preload("res://Scenes/undead.tscn")
var root
var timer
var can_spawn = true
var spawn_ct = 0

const time = 3 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	timer = get_node("Timer")
	print(timer)
	timer.timeout.connect(timeout)
	root = get_node("/root/Game/")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(spawn_ct < 5):
		multi_spawn()


func spawn():
	var enemy = enemy_scene.instantiate()
	root.add_child(enemy)
	print(enemy.global_position)

func multi_spawn():
	if(can_spawn):
		spawn()
		spawn_ct += 1
		can_spawn = false
		position = 100 * Vector2(cos(randf_range(0, 2*PI)), sin(randf_range(0, 2*PI)))
		timer.start(time)

func timeout():
	can_spawn = true
