extends Area2D
@onready var timer = $Timer
@onready var sound_player = $AudioStreamPlayer
@onready var sound_death = $death

var sound_played = false  # Variable to track if the first sound has played

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.die()
		sound_player.play()
		print("You died!")
		Engine.time_scale = 0.5
		body.get_node("normal").queue_free()
		timer.start()  # Start the timer to play the second sound after a delay
func _on_timer_timeout():
	if not sound_played:
		print("hello")
		sound_death.play()
		sound_played = true  # Mark the sound as played
		timer.start()  # Start the timer again to reload the scene
	else:
		Engine.time_scale = 1.0
		get_tree().reload_current_scene()
