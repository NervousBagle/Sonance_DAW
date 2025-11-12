extends Control
@onready var project_editor = preload("res://pantalla_editor.tscn")

func _on_create_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://pantalla_editor.tscn")
