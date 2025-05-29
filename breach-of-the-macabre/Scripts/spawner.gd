extends Node2D

var enemy_scene
var enemy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_scene = preload("res://Scenes/undead.tscn")
	enemy = enemy_scene.instantiate()
	
	add_child(enemy)
	enemy.position += Vector2(10, 0)
	add_child(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
