extends Node2D

var elapsed = 0 
var last_mode
	
func death_screen():
	get_tree().change_scene_to_file("res://Scenes/Menus/death_screen.tscn")


func _on_new_game_pressed():
	_change_new_game_selection("on")
	
func _on_return_pressed():
	pass # Replace with function body.

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/options_screen.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_cancel_new_game_pressed():
	_change_new_game_selection("off")


func _on_arena_run_pressed():
	last_mode = "arena"
	get_tree().change_scene_to_file("res://Scenes/Stages/map_arena.tscn")


func _on_normal_run_pressed():
	last_mode = "normal"
	get_tree().change_scene_to_file("res://Scenes/Stages/map_starry_night.tscn")


func _change_new_game_selection(turn):
	if turn == "on": 
		get_node("main_buttons/new_game").visible = false
		get_node("main_buttons/new_game").disabled = true
		get_node("main_buttons/normal_run").disabled = false
		get_node("main_buttons/normal_run").visible = true
		get_node("main_buttons/arena_run").disabled = false
		get_node("main_buttons/arena_run").visible = true
		get_node("cancel_new_game").visible = true
		get_node("cancel_new_game").disabled = false
	elif turn == "off":
		get_node("main_buttons/new_game").visible = true
		get_node("main_buttons/new_game").disabled = false
		get_node("main_buttons/normal_run").disabled = true
		get_node("main_buttons/normal_run").visible = false
		get_node("main_buttons/arena_run").disabled = true
		get_node("main_buttons/arena_run").visible = false
		get_node("cancel_new_game").visible = false
		get_node("cancel_new_game").disabled = true
