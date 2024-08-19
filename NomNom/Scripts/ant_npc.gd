extends CharacterBody2D


const SPEED = 300.0
var input_direction := Vector2.ZERO
var colony_member = false
@onready var root = preload("res://NomNom/Scenes/root.tscn").instantiate()
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var main_character = get_node("/root/root/Map/MainCharacter")

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if colony_member:
		if (self.position - main_character.position).length() > 200:
			get_close()
		elif input_direction != Vector2.ZERO:
			velocity = input_direction * SPEED
			ant_animation(input_direction)
			move_and_slide()
		else:
			animated_sprite_2d.stop()
	elif main_character and (self.position - main_character.position).length() < 500:
			main_character.add_ant_number(self)
			colony_member = true
			

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
	
func get_close():
	var direction = -(self.position - main_character.position).normalized()
	var animate_direction = direction
	if abs(direction.x) > abs(direction.y) * 5:
		animate_direction = Vector2(direction.x,0)
	elif abs(direction.y) > abs(direction.x) * 5:
		animate_direction = Vector2(0, direction.y)
	ant_animation(animate_direction)
	velocity = direction * SPEED
	move_and_slide()
