extends Node2D

var speed = 100
var vel = Vector2()

func _ready():
	set_process(true)

func _process(delta):
	vel = Vector2() # set vel to Vector2(0, 0)
	vel = Vector2(speed, 0) # setting vel to desired direction
	global_translate(vel * delta)
