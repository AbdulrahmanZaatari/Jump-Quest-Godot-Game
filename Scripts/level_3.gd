extends Node2D
@onready var level3=$level3

func _ready():
	if musicPlayer.music_player != null or musicPlayer.sound != null  or musicPlayer.level3story != null:
		musicPlayer.music_player.stop()
		musicPlayer.sound.stop()
		musicPlayer.level3story.stop()
	level3.play()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")


func _on_body_entered(body):
	if body is CharacterBody2D:
		await get_tree().create_timer(2.0).timeout  # Wait for 2 seconds
		get_tree().change_scene_to_file("res://Scenes/Level2 dialogue/6.tscn")

