extends Area2D
@onready var audio_stream_player = $AudioStreamPlayer

func _on_body_entered(body):
	if body is CharacterBody2D:
		audio_stream_player.play()
		await get_tree().create_timer(2.0).timeout  # Wait for 2 seconds
		get_tree().change_scene_to_file("res://Scenes/Level2 dialogue/6.tscn")
