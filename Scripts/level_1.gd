extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if musicPlayer.music_player != null:
		musicPlayer.music_player.stop()

	# Get the AudioStreamPlayer node in the scene and play the new song
	var new_music_player = $AudioStreamPlayer
	new_music_player.stream = preload("res://Assets/Music/time_for_adventure.mp3")
	new_music_player.play()



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
