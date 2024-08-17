extends CharacterBody2D

var speed = 150  # Lowercase variable name to follow Godot's naming convention
const NORMAL_SPEED = 150  # Constant for normal speed
const JUMP_VELOCITY = 0
var is_slippery = false  # Tracks if the player is on a slippery surface

# New variables for slippery friction
const SLIPPERY_ACCELERATION = 300
const SLIPPERY_DECELERATION = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var a_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		a_sprite.flip_h = false
	elif direction < 0:
		a_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
		if direction == 0:
			a_sprite.play("idle")
		else:
			a_sprite.play("run")
	
	# Adjust acceleration and deceleration based on surface
	if is_slippery:
		# Apply slippery movement
		if direction != 0:
			velocity.x = move_toward(velocity.x, direction * NORMAL_SPEED, SLIPPERY_ACCELERATION * delta)
		else:
			velocity.x = move_toward(velocity.x, 0, SLIPPERY_DECELERATION * delta)
		print("Slippery mode active")
	else:
		# Apply normal movement
		if direction != 0:
			velocity.x = direction * NORMAL_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, NORMAL_SPEED)  # Use NORMAL_SPEED for deceleration
		print("Normal mode active")
	move_and_slide()

# Function to set the jump velocity
func set_jump_velocity(new_jump_velocity):
	velocity.y = new_jump_velocity
	
# Function to set the slippery state
func set_slippery(value: bool):
	is_slippery = value

# Function to handle the player's death
func die():
	velocity = Vector2.ZERO  # Stop player movement
	a_sprite.play("die")
