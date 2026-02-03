extends Node2D


@export var ball_scene: PackedScene = preload("res://enemy1.tscn")

func _ready() -> void:
	var spawnPoint = Vector2(320, 128)
	spawn(spawnPoint)

func spawn(spawn_global_position: Vector2) -> void:
	var instance: Node2D = ball_scene.instantiate()
	instance.global_position = spawn_global_position
	add_child(instance)
