extends Control
@onready var game_manager = %GameManager


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		game_manager.close_instructions()
