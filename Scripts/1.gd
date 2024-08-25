extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if musicPlayer.music_player != null:
		musicPlayer.music_player.stop()
	
	musicPlayer.play_level3Story()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_pressed():
		get_tree().change_scene_to_file("res://Scenes/Level2 dialogue/2.tscn")


func _on_back_pressed():
		get_tree().change_scene_to_file("res://Scenes/storylevel2.tscn")
