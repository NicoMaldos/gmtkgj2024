extends Area2D

@onready var game_manager = %GameManager
@onready var title_label: Label = $Label
@onready var collisionShape = $CollisionShape2D
@onready var full_bush = $BushCollision/Full
@onready var medium_bush = $BushCollision/Medium
@onready var low_bush = $BushCollision/Low
@onready var empty_bush = $BushCollision/Empty

@export var resource_name = ''
@export var isDestroyable = false
var should_deplete = false
var actual_food = 80
var ants_inside = 0


func _ready() -> void:
	title_label.text = resource_name

func _on_body_entered(body: Node2D) -> void:
	if actual_food > 0:
		should_deplete = true
		game_manager.activate_resource(resource_name)
		ants_inside += 1
		

func _on_body_exited(body: Node2D) -> void:
	if actual_food > 0:
		ants_inside -= 1
		if ants_inside == 0:
			should_deplete = false
			game_manager.activate_resource('')
			game_manager.deactivate_resource(resource_name)

func _physics_process(delta: float) -> void:
	if should_deplete:
		actual_food -= 1
		if actual_food == 60:
			full_bush.hide()
			medium_bush.show()
		elif actual_food == 20:
			medium_bush.hide()
			low_bush.show()
		elif actual_food == 0:
			low_bush.hide()
			empty_bush.show()
			game_manager.activate_resource('')
			game_manager.deactivate_resource(resource_name)
			should_deplete = false
