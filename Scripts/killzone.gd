extends Area2D
@onready var timer = $Timer
@onready var sound_player = $AudioStreamPlayer  # Get the AudioStreamPlayer node

func _on_body_entered(body):
	if body is CharacterBody2D:
		sound_player.play()
		print("You diedd!")
		Engine.time_scale = 0.5
		body.die() # Call the die function on the player
		body.get_node("CollisionShape2D").queue_free()
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
