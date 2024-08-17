extends Area2D

@onready var game_manager = %GameManager
@onready var title_label: Label = $Label
@onready var collisionShape = $CollisionShape2D

@export var resource_name = ''
@export var isDestroyable = false
var should_deplete = false


func _ready() -> void:
	title_label.text = resource_name

func _on_body_entered(body: Node2D) -> void:
	should_deplete = true
	game_manager.activate_resource(resource_name)

func _on_body_exited(body: Node2D) -> void:
	should_deplete = false
	game_manager.activate_resource('')

func _physics_process(delta: float) -> void:
	if should_deplete and isDestroyable:
		var scale_modifier = Vector2.ONE - (game_manager.SCALE_RATIO*10)
		apply_scale(scale_modifier)
		if (scale < Vector2(0.3, 0.3)):
			queue_free()
