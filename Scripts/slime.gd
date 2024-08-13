extends Node2D

const speed = 60
var direction = 1
@onready var r_cright = $RCright
@onready var r_cleft = $RCleft
@onready var a_sprite = $AnimatedSprite2D

func _process(delta):
	if r_cright.is_colliding():
		direction = -1
		a_sprite.flip_h = true
	if r_cleft.is_colliding():
		direction = 1
		a_sprite.flip_h = false
	position.x += direction*speed*delta
