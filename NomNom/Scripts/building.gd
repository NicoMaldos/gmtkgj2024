extends Area2D

@onready var title_label: Label = $Label
@export var building_type = ''
@onready var main_character = %MainCharacter
@onready var game_manager = %GameManager
@onready var add_energy_animation = $Bar/Sprite2D/Label/AddEnergy
@onready var add_food_animation = $Factory/Sprite2D/Label/AddFood
@onready var add_ant_animation = $Brothel/Sprite2D/Label/AddAnt

@onready var bar = get_node("Bar")
@onready var factory = get_node("Factory")
@onready var brothel = get_node("Brothel")
@onready var build_site = get_node("BuildSite")

const total_ants = 2
var actual_ants = 0
var is_built = false

func _ready() -> void:
	title_label.text = building_type + "0/" + str(total_ants)
	
func _on_body_entered(body: Node2D) -> void:
	if actual_ants < total_ants:
		game_manager.use_ants(self)

func _on_body_exited(body: Node2D) -> void:
	game_manager.use_ants('')

func add_ant():
	actual_ants += 1
	if actual_ants < total_ants:
		title_label.text = building_type + str(actual_ants) + "/" + str(total_ants)
	else:
		title_label.text = building_type
		build_site.hide()
		if building_type == "Bar":
			bar.show()
			game_manager.bar_activated = true
		elif building_type == "Factory":
			factory.show()
			game_manager.factory_activated = true
		elif building_type == "Brothel":
			brothel.show()
			game_manager.brothel_activated = true
			
func play_animation():
	if building_type == "Bar":
		add_energy_animation.play("Popup")
	elif building_type == "Factory":
		add_food_animation.play("Popup")
	elif building_type == "Brothel":
		add_ant_animation.play("Popup")
