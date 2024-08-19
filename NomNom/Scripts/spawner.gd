extends Node2D

@onready var enemy = preload("res://NomNom/Scenes/ant_npc.tscn")
@onready var game_manager = %GameManager

var random = RandomNumberGenerator.new()

func _on_cooldown_timeout() -> void:
	#spawn(random.randi_range(0,0), random.randi_range(0,0))
	var ant_hills = [[1593, -453], [-289, 495], [-3332, 210]]
	var random_anthill = ant_hills.pick_random()
	spawn(random_anthill[0], random_anthill[1])
	if game_manager.brothel_activated:
		spawn(-2766, -1383)

func spawn(coord_x, coord_y):
	#print(check_collision_with_shape(Vector2(coord_x, coord_y)))
	var random_x = random.randi_range(0,2)
	var random_y = random.randi_range(0,2)
	var ene = enemy.instantiate()
	var sign = [-1,1]
	var sign_x = randi() % sign.size()
	var sign_y = randi() % sign.size()
	print(coord_x + sign_x * 50)
	print(coord_y + sign_x  * 50)
	ene.position = Vector2(coord_x + sign_x * random_x * 50, coord_y + sign_x * random_y  * 50)
	get_parent().get_node("Map/NPC").add_child(ene)
