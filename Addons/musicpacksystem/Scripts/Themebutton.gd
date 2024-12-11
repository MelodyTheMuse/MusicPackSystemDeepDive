@tool
extends OptionButton
var audio_player_node
var DS:DynamicStream
var Ds_scene:PackedScene = preload("res://Addons/musicpacksystem/Add-To-Game/AudioPlayer.tscn")
@export var MoodBox = OptionButton.new()
var list_themes : Array= []

func _on_ready():
	DS = Ds_scene.instantiate()
	load_dir()
	clear()
	for I in range(list_themes.size()):
		add_item(list_themes[I].resource_path.get_file().get_basename())
		MoodLoader(0)

func _on_item_selected(index: int) -> void:
	MoodLoader(index)
	

func MoodLoader(index: int):
	MoodBox.clear()
	var theme = list_themes[index] 
	if theme.clip_count != 0:
		for I in range(theme.clip_count):
			MoodBox.add_item(theme.get_clip_name(I))

func load_dir():
	var file_path = "res://Addons/musicpacksystem/Themes"
	var dir = DirAccess.open(file_path)
	if dir:
		dir.list_dir_begin()
		var filename = dir.get_next()
		while (filename != ""):
			if filename.ends_with(".tres"):
				var item = ResourceLoader.load(file_path+"/"+filename) as AudioStreamInteractive
				
				list_themes.append(item)
				filename = dir.get_next()
				
func get_audio_player():
	
	return list_themes[selected]

func _on_button_pressed() -> void:
	print(list_themes[selected])
