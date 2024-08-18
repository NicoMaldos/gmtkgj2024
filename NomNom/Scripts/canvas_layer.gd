extends CanvasLayer


@onready var ants_var_label: Label = $VBoxContainer/AntsHBoxContainer/AntsVarLabel
@onready var energy_var_label: Label = $VBoxContainer/EnergyBoxContainer/EnergyVarLabel
@onready var food_var_label: Label = $VBoxContainer/FoodHBoxContainer/FoodVarLabel
@onready var game_manager = %GameManager
@onready var main_character = %MainCharacter

func _ready() -> void:
	updateLabels()

func _physics_process(delta: float) -> void:
	updateLabels()

func updateLabels() -> void:
	energy_var_label.text = str(round(game_manager.energy_actual))
	food_var_label.text = str(round(game_manager.food_actual))
	ants_var_label.text = str(round(main_character.ant_number))
