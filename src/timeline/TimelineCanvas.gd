extends Control

@export var bgColor = Color(0.1, 0.1, 0.1)
@export var rejillaColor = Color(0.1, 0.1, 0.1)
@onready var view = get_parent()
var state
var cellWidth

func _ready():
	print("lista")
	pass

func _draw():
	print("- Dibujando")
	var cellWidthReal = state.cell_width * state.zoom
	var offset = state.scroll_offset
	print("CW:", cellWidthReal, " Zoom:", state.zoom)
	var w = size.x
	var h = size.y
	draw_rect(Rect2(Vector2.ZERO, size), bgColor)
	for x in range(-offset, int(w) - offset, int(cellWidthReal)): 
		draw_line(
			Vector2(x, 0),
			Vector2(x, h),
			rejillaColor
			)


func redraw():
	print("- Re Dibujar")
	queue_redraw()

func update_from_view(view_state):
	state = view_state
	redraw()
	pass
