extends Node

@onready var eating_sfx = $"../Node/eating sfx"
@onready var fail_screen = $"../CanvasLayer/Fail screen"

var energy_actual = 2
const ENERGY_TICKS = 3
var energy_ticks_left

var food_actual = 50
const FOOD_TICKS = 10
var food_ticks_left

var food_eat_tick 
const FOOD_EAT_TICKS = 5


@onready var root = $".."

var size_actual = 1.0
var active_resource = ''


const SCALE_RATIO = Vector2(0.001,0.001)

func _ready() -> void:
	energy_ticks_left = ENERGY_TICKS
	food_ticks_left = FOOD_TICKS
	food_eat_tick = 1
	Engine.time_scale = 1
	
func show_fail_screen():
	Engine.time_scale = 0
	fail_screen.show()

func activate_resource(resource: String)-> void:
	active_resource = resource
	
func deactivate_resource(resource: String)-> void:
	if resource == 'food':
		food_eat_tick = 1		
	
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
		show_fail_screen()


func increase_resources() -> void:
	if active_resource == 'food':
		food_actual += 1
		food_eat_tick -= 1
		if food_eat_tick <= 0:
			eating_sfx.play()
			food_eat_tick = FOOD_EAT_TICKS
		
		
	if active_resource == 'energy':
		energy_actual += 1
		food_actual -= 0.5
		size_actual += 0.1
	
func _on_timer_timeout() -> void:
	decrease_resources()
	increase_resources()
