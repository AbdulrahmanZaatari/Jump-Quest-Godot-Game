extends Area2D

@onready var timer = $Timer
@onready var sound_player = $AudioStreamPlayer
@onready var sound_death = $death
@onready var camera = $"path_to_your_camera_node"  # Replace with the correct path to your Camera2D node

var sound_played = false  # Variable to track if the first sound has played

func _on_body_entered(body):
	if body is CharacterBody2D:
		# Play the death animation or effect on the player
		body.die()  # Trigger the player's death logic
		sound_player.play()  # Play the explosion sound
		Engine.time_scale = 0.5  # Slow down time for dramatic effect

		# Apply a screen shake effect
		start_screen_shake()

		# Apply an explosion-like impact by altering the player's velocity
		apply_explosion_velocity(body)

		body.get_node("normal").queue_free()  # Remove the player sprite or node (adjust as necessary)
		timer.start(0.5)  # Start the timer to play the second sound after a delay

func _on_timer_timeout():
	if not sound_played:
		sound_death.play()
		sound_played = true  # Mark the sound as played
		timer.start(0.5)  # Start the timer again to reload the scene
	else:
		Engine.time_scale = 1.0  # Reset the time scale
		get_tree().reload_current_scene()  # Reload the scene

func apply_explosion_velocity(body):
	# Apply a velocity change to simulate the explosion's impact
	var explosion_vector = (body.global_position - global_position).normalized() * 500  # Adjust the force as needed
	body.velocity += explosion_vector

func start_screen_shake():
	# Apply a screen shake effect to the Camera2D node
	if camera:
		var tween = create_tween()
		tween.tween_property(camera, "offset", Vector2(randf_range(-10, 10), randf_range(-10, 10)), 0.05)
		tween.tween_property(camera, "offset", Vector2.ZERO, 0.05)
