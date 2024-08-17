extends Node

var energy_actual = 80
const ENERGY_TICKS = 3
var energy_ticks_left

var food_actual = 50
const FOOD_TICKS = 10
var food_ticks_left

var size_actual = 1.0
var active_resource = ''

const SCALE_RATIO = Vector2(0.001,0.001)

func _ready() -> void:
	energy_ticks_left = ENERGY_TICKS
	food_ticks_left = FOOD_TICKS

func activate_resource(resource: String)-> void:
	active_resource = resource

func decrease_resources() -> void:
	energy_ticks_left -= 1
	food_ticks_left -= 1
	if energy_ticks_left <= 0:
		energy_actual -= 1
		energy_ticks_left = ENERGY_TICKS 
	if food_ticks_left <= 0:
		food_actual -= 1
		food_ticks_left = FOOD_TICKS
	if food_actual <= 0 or energy_actual <= 0:
		#Game Over
		get_tree().quit()

func increase_resources() -> void:
	if active_resource == 'food':
		food_actual += 1
	if active_resource == 'energy':
		energy_actual += 1
		food_actual -= 0.5
		size_actual += 0.1
	
func _on_timer_timeout() -> void:
	decrease_resources()
	increase_resources()
