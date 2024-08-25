extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if musicPlayer.music_player != null:
		musicPlayer.music_player.stop()

	# Get the AudioStreamPlayer node in the scene and play the new song
	var new_music_player = $AudioStreamPlayer
	new_music_player.stream = preload("res://Assets/Music/pixify-230092.mp3")
	new_music_player.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")


func _on_body_entered(body):
	if body is CharacterBody2D:
		await get_tree().create_timer(2.0).timeout  # Wait for 2 seconds
		get_tree().change_scene_to_file("res://Scenes/storylevel2.tscn")

