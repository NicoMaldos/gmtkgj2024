extends Area2D

@export var scaleSize = 1.0
@onready var timer = $Timer
@onready var area = $ClickeableArea
var shouldGrow = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shouldGrow:
		area.apply_scale(Vector2(1 + (scaleSize/1000), 1 + (scaleSize/1000)))
		if area.scale > Vector2(4,4) or area.scale < Vector2(0.5,0.5):
			scaleSize = scaleSize * -1
	pass
	

func _on_timer_timeout() -> void:
	#scaleSize += 0.05
	#area.apply_scale(Vector2(scaleSize, scaleSize))
	if !shouldGrow:
		timer.stop() 
	pass # Replace with function body.


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('Clicked')
		shouldGrow = !shouldGrow
	pass # Replace with function body.
