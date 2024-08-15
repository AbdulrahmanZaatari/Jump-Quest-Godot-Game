extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	musicPlayer.play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_2_pressed():
		get_tree().change_scene_to_file("res://Scenes/scene_3.tscn")


func _on_back_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/scene1.tscn")
