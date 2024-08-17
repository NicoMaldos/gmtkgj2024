extends CharacterBody2D


const SPEED = 300.0
var input_direction := Vector2.ZERO
@onready var camera_2d: Camera2D = $Camera2D
@onready var game_manager = %GameManager

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED
	move_and_slide()
	if game_manager.active_resource == 'energy':
		apply_scale(Vector2.ONE + game_manager.SCALE_RATIO)
		camera_2d.set_zoom(camera_2d.zoom * (Vector2.ONE - game_manager.SCALE_RATIO))
