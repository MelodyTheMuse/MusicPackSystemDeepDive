@tool
extends OptionButton
@export var theme_button = OptionButton.new()
var list_themes:Array 

func _on_item_selected(index: int) -> void:
	pass
	var ASI = "yay"
	
func load_dir():
	var file_path = "res://Addons/musicpacksystem/Themes"
	var dir = DirAccess.open(file_path)
	if dir:
		dir.list_dir_begin()
		var filename = dir.get_next()
		while (filename != ""):
			if filename.ends_with(".tres"):
				var item = ResourceLoader.load(file_path+"/"+filename)
				list_themes.append(item)
				filename = dir.get_next()
func get_mood():
	load_dir()
	return list_themes[theme_button.selected].get_clip_stream(selected)
