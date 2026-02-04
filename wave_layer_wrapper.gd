extends StaticBody2D

@onready
var maxOffset = Vector2(0, 768)
var speed = 1

func _process(delta: float) -> void:
	if(position.y >= maxOffset.y):
		position = Vector2(0, 0)
		return
		
	var forward_vector = Vector2.DOWN
	var velocity = forward_vector * 1 * speed
	move_and_collide(velocity)
	
	
