@tool
extends EditorPlugin

const MusicPanel =preload("res://Addons/music_screen/music_panel.tscn")

var music_panel_instance


func _enter_tree():
	music_panel_instance = MusicPanel.instantiate()
	EditorInterface.get_editor_main_screen().add_child(music_panel_instance)
	_make_visible(false)
	
func _exit_tree():
	if music_panel_instance:
		music_panel_instance.queue_free()

func _has_main_screen():
	return true

func _make_visible(visible):
	if music_panel_instance:
		music_panel_instance.visible=visible

func _get_plugin_name():
	return "Music GUI"

func _get_plugin_icon():
	return EditorInterface.get_editor_theme().get_icon("Node", "EditorIcons")
