extends Control

signal dialogue_finished

@export var dialogue_speed = 0.05  # Speed at which the text appears
@onready var dialogue_label = $Panel/Label  # Reference to the Label node
var current_line = 0
var is_typing = false
var lines = []
var part_index = 0
var text_parts = []

func start_dialogue(new_lines: Array):
	lines = new_lines
	current_line = 0
	part_index = 0
	_prepare_text_parts()
	_show_next_part()

func _prepare_text_parts():
	text_parts = []
	for line in lines:
		text_parts.append(line)
		# Manually split longer lines if needed:
		# text_parts.append("This is the second part of a long dialogue.")

func _show_next_part():
	if part_index < text_parts.size():
		dialogue_label.text = ""
		is_typing = true
		_type_text(text_parts[part_index])
		part_index += 1
	else:
		hide()
		emit_signal("dialogue_finished")

func _type_text(text_part: String):
	dialogue_label.text = text_part
	is_typing = false  # Immediately display for simplicity

func _process(delta):
	if Input.is_action_just_pressed("text") and not is_typing:
		_show_next_part()
