extends Control

var next_scene = preload("res://NomNom/Scenes/root.tscn")

func _on_video_strem_player_finished():
	get_tree().change_scene_to_packed(next_scene)
