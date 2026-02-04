extends CharacterBody2D

@export var speed = 200
@export var rotation_speed = 180 # Degrees per second

var move_direction = 0 # For forward/backward movement input
var turn_direction = 0 # For left/right turn input

func _process(delta):
	get_input()
	update_rotation(delta)
	update_movement(delta)

func get_input():
	# Get input for turning (left/right)
	turn_direction = Input.get_axis("left", "right")

	# Get input for movement (forward/backward)
	move_direction = Input.get_axis("up", "down")

func update_rotation(delta):
	# Apply rotation
	rotation += turn_direction * deg_to_rad(rotation_speed) * delta

func update_movement(delta):
	# Calculate the forward/backward movement vector
	var forward_vector = Vector2.DOWN.rotated(rotation)
	
	# Set the velocity based on movement input and direction
	velocity = forward_vector * move_direction * speed
	
	# Apply the velocity (and handle collisions if using CharacterBody2D)
	var collision = move_and_collide(velocity * delta)
	if collision:
		print("I collided with ", collision.get_collider().name)
		
		
func _on_full_boat_box_body_entered(body: Node2D) -> void:
	if(body.name.begins_with("Bullet")):
		print("Player hit by bullet!")
		
func _on_hull_box_body_entered(body: Node2D) -> void:
	if(body.name == "WaveLayer"):
		print("Wave Enter")
		speed -= 150

func _on_hull_box_body_exited(body: Node2D) -> void:
	if(body.name == "WaveLayer"):
		print("Wave Exit")
		speed = 200
func _unhandled_input(input_event: InputEvent) -> void:
	if input_event.is_echo():
		return

	if input_event is InputEventMouseButton and input_event.is_pressed():
		if input_event.button_index == MOUSE_BUTTON_LEFT:
			var line : Line2D = get_node("Line2D")
			if(line.visible):
				line.remove_point(1)
			line.add_point(get_local_mouse_position())
			line.visible = true
			
		if input_event.button_index == MOUSE_BUTTON_RIGHT:
			var line : Line2D = get_node("Line2D")
			if(line.visible):
				line.remove_point(1)
				line.visible = false
			
			
			
