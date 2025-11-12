extends Control

@onready var timelineCanvas: Control = $TimelineCanvas
var zoom = 1.0
var scroll_offset = 0.0
var unit_mode = "seconds"
var lenght_seconds
var cell_width := 100.0

func _ready() -> void:
	timelineCanvas.update_from_view(self)

func _gui_input(event):
	# Scroll horizontal con arrastre
	if event is InputEventMouseMotion and event.button_mask & MOUSE_BUTTON_MASK_MIDDLE:
		scroll_offset -= event.relative.x
		scroll_offset = clamp(scroll_offset, 0, 10000)
		print(scroll_offset)
		timelineCanvas.redraw()

	# Zoom con rueda
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1.1
		timelineCanvas.redraw()

		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom *= 0.9
		timelineCanvas.redraw()
