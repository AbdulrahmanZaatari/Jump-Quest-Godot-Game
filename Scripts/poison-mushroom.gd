extends Area2D

@onready var poison_collision_shape = $CollisionShape2D  # Reference to the collision shape
@onready var animated_sprite = $AnimatedSprite2D         # Reference to the AnimatedSprite2D
@onready var timer = $Timer                              # Reference to the Timer node

@export var poison_interval = 2.25  # Time in seconds for how long the poison animation should play
@export var idle_interval = 2.0    # Time in seconds for how long the idle animation should play

var timer_count = 0.0

func _ready():
	# Start with the idle animation
	play_idle()
	# Connect the body_entered signal
	connect("body_entered", Callable(self, "_on_Mushroom_body_entered"))

func _process(delta):
	# Increment the timer
	timer_count += delta
	
	# Check if it's time to switch animations
	if animated_sprite.animation == "idle" and timer_count >= idle_interval:
		play_poison()
	elif animated_sprite.animation == "poison" and timer_count >= poison_interval:
		play_idle()

func play_idle():
	print("Playing idle animation")
	animated_sprite.play("idle")
	timer_count = 0.0
	poison_collision_shape.disabled = true  # Disable the collision shape

func play_poison():
	print("Playing poison animation")
	animated_sprite.play("poison")
	timer_count = 0.0
	poison_collision_shape.disabled = false  # Enable the collision shape
	
# This function is called when the timer times out
func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()


func _on_body_entered(body):
	print("Body entered the mushroom area")
	if body is CharacterBody2D and not poison_collision_shape.disabled:
		print("Player is in poison area - dying")
		body.die()  # Call the player's death function
		# Slow down time and remove the collision shape
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
