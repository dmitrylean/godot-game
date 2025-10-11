extends MeshInstance3D

# Player movement speed
var speed = 5.0

func _process(delta):
	# Get input axes
	var input_dir = Vector3.ZERO

	# Basic WASD movement
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_up"):
		input_dir.z -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.z += 1

	# Normalize movement (to avoid diagonal speed boost)
	if input_dir.length() > 0:
		input_dir = input_dir.normalized()

	# Apply movement
	translate(input_dir * speed * delta)
