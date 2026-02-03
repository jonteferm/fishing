extends CharacterBody2D

@export var speed = 200
@export var rotation_speed = 180 # Degrees per second

var move_direction = 0 # For forward/backward movement input
var turn_direction = 0 # For left/right turn input

func _process(delta):
	#update_rotation(delta)
	update_movement(delta)

func update_rotation(delta):
	# Apply rotation
	rotation += turn_direction * deg_to_rad(rotation_speed) * delta

func update_movement(delta):
	# Calculate the forward/backward movement vector
	var forward_vector = Vector2.DOWN.rotated(rotation)
	
	# Set the velocity based on movement input and direction
	velocity = forward_vector * move_direction * speed
	
	# Apply the velocity (and handle collisions if using CharacterBody2D)
	move_and_slide()
