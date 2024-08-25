extends Node2D

func _ready():
	if musicPlayer.music_player != null or musicPlayer.sound != null  or level4.level4!=null  or level4.end!=null  or musicPlayer.level3story !=null:
		
		musicPlayer.music_player.stop()
		musicPlayer.sound.stop()
		level4.level4.stop()
		musicPlayer.level3story.stop()
		level4.end.stop()

	# Get the AudioStreamPlayer node in the scene and play the new song
	level4.play_level4music()

	

	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
