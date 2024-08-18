extends Node2D

@onready var enemy = preload("res://NomNom/Scenes/ant_npc.tscn")

var random = RandomNumberGenerator.new()

func _on_cooldown_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = Vector2(random.randi_range(0,500),random.randi_range(0,500))
	get_parent().get_node("Map/NPC").add_child(ene)
