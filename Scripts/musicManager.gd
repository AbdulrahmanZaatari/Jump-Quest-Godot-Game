extends Node2D
var sound=null
var level3story=null

var music_player = null

func _ready():
	# Load the music file
	music_player = AudioStreamPlayer.new()
	sound=AudioStreamPlayer.new()
	level3story = AudioStreamPlayer.new()
	music_player.stream = preload("res://Assets/Music/Quirky-Platformer.mp3")
	music_player.play()
	add_child(music_player)
	sound.stream = preload("res://Assets/Music/storytelling level1.wav")
	sound.play()
	add_child(sound)
	level3story.stream = preload("res://Assets/Music/level3 storytelling.wav")
	level3story.play()
	add_child(level3story)
	

func play_music():
	if !music_player.playing :
		sound.stop()
		level3story.stop()
		music_player.play()

func play_sound():
	if !sound.playing or music_player.playing :
		level3story.stop()
		music_player.stop()
		sound.play()
		
		
func play_level3Story():
	if sound.playing or music_player.playing or !level3story.playing:
		music_player.stop()
		sound.stop()
		level3story.play()
