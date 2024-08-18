extends Area2D
@onready var sound_play= $AudioStreamPlayer

# Constant for the trampoline jump velocity
const TRAMPOLINE_JUMP_VELOCITY = -500
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body):
	if body is CharacterBody2D:
		sound_play.play()
		body.set_jump_velocity(TRAMPOLINE_JUMP_VELOCITY)
