extends Area2D

@onready var audio_stream_player = $AudioStreamPlayer

func _on_body_entered(body):
	print("Body entered")
	if body is CharacterBody2D:
		audio_stream_player.play()
		await get_tree().create_timer(2.0).timeout # Wait for 2 seconds
		# Use the correct way to reference the current scene and change scenes

		var current_scene_path = get_tree().get_current_scene().get_name() 
		print(current_scene_path) # This retrieves the filename of the current scene
		
		if current_scene_path == 'Level 1':
			get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
		elif current_scene_path == 'Level 2':
			get_tree().change_scene_to_file("res://Scenes/storylevel2.tscn")
		elif current_scene_path == 'Level 3':
			get_tree().change_scene_to_file("res://Scenes/Level2 dialogue/6.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
