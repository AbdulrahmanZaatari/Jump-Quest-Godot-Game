extends Node


var level4 = AudioStreamPlayer.new()
var end = AudioStreamPlayer.new()

func _ready():
	level4.stream = preload("res://Assets/Music/level4.wav")
	level4.play()
	add_child(level4)
	end.stream = preload("res://Assets/Music/the end.wav")
	end.play()
	add_child(end)
	level4.set_autoplay(false)  
	end.set_autoplay(false)  

func play_level4music():
	if !level4.playing or end.playing:
		end.stop()
		level4.play()
func play_endmusic():
	if level4.playing or !end.playing:
		level4.stop()
		end.play()
