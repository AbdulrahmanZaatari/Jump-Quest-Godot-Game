extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	musicPlayer.play_music()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")


func _on_go_to_story_pressed():
	get_tree().change_scene_to_file("res://Scenes/scene1.tscn")
