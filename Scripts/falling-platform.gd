extends RigidBody2D

@onready var timer = $Timer

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		set_deferred("freeze", false)
		timer.start()

func _on_timer_timeout():
	queue_free()  # Remove the platform from the scene
