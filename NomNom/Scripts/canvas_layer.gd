extends CanvasLayer


@onready var ants_var_label = $VBoxContainer/AntsHBoxContainer/RichTextLabel
@onready var energy_var_label = $VBoxContainer/EnergyBoxContainer/RichTextLabel
@onready var food_var_label = $VBoxContainer/FoodHBoxContainer/RichTextLabel
@onready var game_manager = %GameManager
@onready var main_character = %MainCharacter

func _ready() -> void:
	updateLabels()

func _physics_process(delta: float) -> void:
	updateLabels()

func updateLabels() -> void:
	energy_var_label.text = "[img=16x16]res://NomNom/Assets/objects/lightning.png[/img]:" + str(round(game_manager.energy_actual))
	food_var_label.text = "[img=16x16]res://NomNom/Assets/objects/cherry.png[/img]:" + str(round(game_manager.food_actual))
	ants_var_label.text = "[img=16x16]res://NomNom/Assets/Ants/single_ant.png[/img]:" + str(round(main_character.ant_number))
