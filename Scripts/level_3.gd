extends Node2D

func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
