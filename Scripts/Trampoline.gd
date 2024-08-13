extends Area2D

# Constant for the trampoline jump velocity
const TRAMPOLINE_JUMP_VELOCITY = -500
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body):
	print("Body entered:", body)  # Debugging line
	if body is CharacterBody2D:
		print("Player entered trampoline area")  # Debugging line
		body.set_jump_velocity(TRAMPOLINE_JUMP_VELOCITY)
