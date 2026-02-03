extends CharacterBody2D

@export var orbit_radius = 128.0
@export var orbit_speed = 1.0 # Radians per second
@export var orbit_center: Vector2 # Set this in the Inspector

var angle = 0

func _ready() -> void:
	orbit_center = position

func _physics_process(delta):

	# Calculate new angle
	angle += orbit_speed * delta

	# Calculate new position using trigonometry (polar to Cartesian)
	# `cos(angle)` gives x, `sin(angle)` gives y
	var new_pos = orbit_center + Vector2(cos(angle), sin(angle)) * orbit_radius
	position = new_pos

	# Optional: Make the character face the center point
	look_at(orbit_center)

	# Since this is CharacterBody2D, use move_and_slide if you need collisions,
	# but for pure orbiting, setting global_position is often enough.
	velocity = (new_pos - position) / delta # for move_and_slide if needed
	move_and_slide()
