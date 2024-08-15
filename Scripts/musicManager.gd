extends Node

var music_player = null

func _ready():
	# Load the music file
	music_player = AudioStreamPlayer.new()
	music_player.stream = preload("res://Assets/Music/Quirky-Platformer.mp3")
	music_player.play()
	add_child(music_player)

func play_music():
	if !music_player.playing:
		music_player.play()
