extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if level4.level4!= null or  level4.end!=null :
		level4.end.stop()
		level4.level4.stop()
	musicPlayer.play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/scene1.tscn")





func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_page.tscn")
	


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	



func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/storylevel2.tscn")
	



func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_4.tscn")
