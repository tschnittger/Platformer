extends Node2D

func _ready():
	get_node("Player").init()
	get_node("Player").get_node("Camera2D").get_node("Time").timer(true)
