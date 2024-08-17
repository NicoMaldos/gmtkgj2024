extends CharacterBody2D


const SPEED = 300.0
var input_direction := Vector2.ZERO
var ant_number = 0
@onready var camera_2d: Camera2D = $Camera2D
@onready var game_manager = %GameManager
@onready var title_label: Label = $Label
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ant_count_message = $AntCount

func _ready() -> void:
	ant_count_message.append_text( str(ant_number) + "[img=16x16]res://NomNom/Assets/Ants/single_ant.png[/img]")

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED
	ant_animation(input_direction)
	move_and_slide()
	if game_manager.active_resource == 'energy':
		apply_scale(Vector2.ONE + game_manager.SCALE_RATIO)
		camera_2d.set_zoom(camera_2d.zoom * (Vector2.ONE - game_manager.SCALE_RATIO))
		set_ant_number()


func set_ant_number():
	ant_count_message.clear()
	ant_count_message.append_text(str(ant_number) + "[img=16x16]res://NomNom/Assets/Ants/single_ant.png[/img]")
	ant_number += 1
	
func ant_animation(input_direction):
	if input_direction.x < 0 and input_direction.y < 0:
		animated_sprite_2d.play("diagonal_1")
	elif input_direction.x > 0 and input_direction.y < 0:
		animated_sprite_2d.play("diagonal_2")
	elif input_direction.x > 0 and input_direction.y > 0:
		animated_sprite_2d.play("diagonal_3")
	elif input_direction.x < 0 and input_direction.y > 0:
		animated_sprite_2d.play("diagonal_4")
	elif input_direction.x < 0:
		animated_sprite_2d.play("left")
	elif input_direction.x > 0:
		animated_sprite_2d.play("right")
	elif input_direction.y < 0:
		animated_sprite_2d.play("up")
	elif input_direction.y > 0:
		animated_sprite_2d.play("down")
	else:
		animated_sprite_2d.stop()
	
