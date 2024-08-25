extends Node2D
@onready var sound=$level1Story


# Called when the node enters the scene tree for the first time.
func _ready():
	if musicPlayer.music_player != null:
		musicPlayer.music_player.stop()
	
	musicPlayer.play_sound()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_2_pressed():
		get_tree().change_scene_to_file("res://Scenes/scene_3.tscn")


func _on_back_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/scene1.tscn")
