extends Control
@onready var label = $Label

var elapsed_time : float = 0.0

func _ready():
	label.text = "Time: 0.0s"
	
	set_process(true)

func _process(delta: float):
	elapsed_time += delta
	label.text = " %.1f" % elapsed_time
