extends AnimatedSprite2D

@onready var DialogueBoxScene = preload("res://Scenes/DialogueBox.tscn")
var dialogue_box  # Declare the dialogue_box variable
@onready var collision = $Area2D/CollisionShape2D

func _ready():
	# Instance the DialogueBox scene
	dialogue_box = DialogueBoxScene.instantiate()
	add_child(dialogue_box)
	dialogue_box.hide()  # Hide initially

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		body.set_physics_process(false)
		var animation_player = body.get_node("AnimatedSprite2D")  # Adjust if the node is different
		animation_player.play("idle")
		start_end_level_dialogue(body)

func start_end_level_dialogue(body):
	dialogue_box.show()
	body.set_process(false)  # Stop the player from processing input

	var lines = [
		"Well, well, well... look who's finally here!",
		"You must be the bravest",
		"or perhaps the most foolish player I've seen.",
		"The Game Designer has been watching you closely",
		"and I must say...",
		"Your determination is... amusing!", 
		"But let's see if you're truly worthy.",
		"I've taken your jumping ability",
		"and I've got to say...",
		"...you look pretty funny hopping around without it!",
		"But don't worry, I'm not that cruel...",
		"well, maybe just a little.",
		"If you press on, I might just return your jump ability.",
		"But only if you promise to jump with style!",
		"None of that clumsy stuff!",
		"So, what do you say? Want your jump back?",
		"Of course you do!", 
		"Here you go, champ. Jump away!"
	]
	
	dialogue_box.start_dialogue(lines)
	await dialogue_box.dialogue_finished
	if collision:
		collision.set_deferred("disabled", true)
	body.set_physics_process(true)
	# Restore the jump ability
	body.set_jump_velocity(-500)  # Example value, adjust as needed
	Engine.time_scale = 0.3
	
	# Schedule the return to the level selector after a delay
	await get_tree().create_timer(1.5).timeout
	
	# Return time to normal and go to the level selector
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
