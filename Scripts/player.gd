extends CharacterBody2D

const SPEED = 150
const JUMP_VELOCITY = 0

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
	# As good practice, you should replace UI actions with custom gameplay actions.
	# gets input direction, either 0,1,-1
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
	# Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# Function to set the jump velocity
func set_jump_velocity(new_jump_velocity):
	velocity.y = new_jump_velocity

# Function to handle the player's death
func die():
	velocity = Vector2.ZERO # Stop player movement
	a_sprite.play("die")
