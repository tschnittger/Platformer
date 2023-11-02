extends Node2D

var elapsed = 0 

func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	#get_tree().get_root().get_node("map_1/Label")
	get_tree().change_scene_to_file("res://Scenes/Stages/map_arena.tscn")
	
func death_screen():
	get_tree().change_scene_to_file("res://Scenes/Menus/death_screen.tscn")
