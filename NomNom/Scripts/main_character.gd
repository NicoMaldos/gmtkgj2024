extends CharacterBody2D


const SPEED = 500.0
var input_direction := Vector2.ZERO
var ant_number = 1
var ant_array = []
@onready var camera_2d: Camera2D = $Camera2D
@onready var game_manager = %GameManager
@onready var title_label: Label = $Label
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ant_count_message = $AntCount
@onready var walking_sfx = $"walking sfx"

func _ready() -> void:
	ant_count_message.append_text( str(ant_number) + "[img=16x16]res://NomNom/Assets/Ants/single_ant.png[/img]")

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED
	ant_animation(input_direction)
	move_and_slide()

func add_ant_number(npc_ant):
	ant_count_message.clear()
	ant_number += 1
	if ant_number == 30:
		get_tree().change_scene_to_file("res://NomNom/Scenes/win_screen.tscn")
	ant_count_message.append_text(str(ant_number) + "[img=16x16]res://NomNom/Assets/Ants/single_ant.png[/img]")
	ant_array.append(npc_ant)
	
func remove_ant():
	ant_count_message.clear()
	ant_number -= 1
	ant_count_message.append_text(str(ant_number) + "[img=16x16]res://NomNom/Assets/Ants/single_ant.png[/img]")
	var deleted_ant = ant_array.pop_back()
	deleted_ant.queue_free()
	
func ant_animation(input_direction):
	if input_direction != Vector2.ZERO and !walking_sfx.playing:
		walking_sfx.play() # Reproduce el sonido si el personaje se mueve y el sonido no está ya sonando
	elif input_direction == Vector2.ZERO and walking_sfx.playing:
		walking_sfx.stop()
		
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
		walking_sfx.stop()
