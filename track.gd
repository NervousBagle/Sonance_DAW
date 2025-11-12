extends HBoxContainer
class_name Track

@export var track_name: String = ""
@export var is_audio: bool = true
@onready var name_field = $TrackControls/PropertyList/HBoxContainer/NameTxt
@onready var loop_button = $TrackControls/PropertyList/AlwaysShownControls/LoopBtn
@onready var record_edit_button = $TrackControls/PropertyList/AlwaysShownControls/RecordBtn
@onready var effects_button = $TrackControls/PropertyList/AlwaysShownControls/EffectsBtn
@onready var delete_button = $TrackControls/PropertyList/DeleteBtn
@onready var timeline = $TrackVisuals/Timeline

signal track_deleted(track)
signal open_properties(track)
signal record_requested(track)
signal loop_toggled(track, enabled)
signal effects_opened(track)

func _ready():
	name_field.text = track_name
	name_field.connect("text_changed", _on_name_changed)
	delete_button.connect("pressed", _on_delete_pressed)
	loop_button.connect("toggled", _on_loop_toggled)
	effects_button.connect("pressed", _on_effects_pressed)
	record_edit_button.connect("pressed", _on_record_edit_pressed)

func _on_name_changed(new_name):
	track_name = new_name

func _on_delete_pressed():
	emit_signal("track_deleted", self)
	queue_free()

func _on_loop_toggled(enabled):
	emit_signal("loop_toggled", self, enabled)

func _on_record_edit_pressed():
	emit_signal("record_requested", self)

func _on_effects_pressed():
	emit_signal("effects_opened", self)
