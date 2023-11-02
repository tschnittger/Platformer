extends Node2D



#Until safefiles are integrated try again will bring the player back into main menu
func _on_try_again_pressed():
	get_tree().change_scene_to_file("res://scene_handler.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
