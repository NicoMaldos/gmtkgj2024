extends Control




func _on_menu_pressed():
	get_tree().change_scene_to_file("res://NomNom/Scenes/menu.tscn")


func _on_exit_pressed():
	get_tree().Quit()
