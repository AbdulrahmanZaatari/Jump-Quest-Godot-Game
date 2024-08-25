extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	level4.play_endmusic()




func _on_next_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")





func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/the end/end3.tscn")
