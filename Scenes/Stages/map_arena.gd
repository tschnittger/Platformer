extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Player").init()
	get_node("Player").get_node("Camera2D").get_node("Time").timer(true)
