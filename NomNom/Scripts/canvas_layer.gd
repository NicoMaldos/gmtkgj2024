extends CanvasLayer


@onready var size_var_label: Label = $VBoxContainer/SizeHBoxContainer/SizeVarLabel
@onready var energy_var_label: Label = $VBoxContainer/EnergyBoxContainer/EnergyVarLabel
@onready var food_var_label: Label = $VBoxContainer/FoodHBoxContainer/FoodVarLabel
@onready var game_manager = %GameManager

func _ready() -> void:
	updateLabels()

func _physics_process(delta: float) -> void:
	updateLabels()

func updateLabels() -> void:
	energy_var_label.text = str(round(game_manager.energy_actual))
	food_var_label.text = str(round(game_manager.food_actual))
	size_var_label.text = str(snapped(game_manager.size_actual, 0.1))
