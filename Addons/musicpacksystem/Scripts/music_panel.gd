@tool
extends Control
var active_scene:Node
@onready var theme_script = $"GridContainer/OptionButton-Theme"
@onready var mood_script = $"GridContainer/OptionButton-Mood"
@onready var DTO = Audio_transfere.new()
@onready var area_scene:PackedScene = preload("../Prefabs/area_music.tscn") 
var area
var shape: CollisionShape2D
func refresh_gui(node):
	#EditorInterface.get_edited_scene_root()
	
	active_scene=node
	UpdateGUI()
func _ready():
	if !OS.has_feature("debug"):
		active_scene = EditorInterface.get_edited_scene_root()
	

func UpdateGUI():
	var AP 
	for I in active_scene.get_children():
		if I is DynamicStream :
			AP = I
			theme_script.audio_player_node = AP
			break
	
func DTO_Set_items(area):
	pass

func DTO_Update():
	area = area_scene.instantiate()
	area.theme = theme_script.get_audio_player()
	area.mood = mood_script.get_mood()
	area.name = "Music Player"
	active_scene.add_child(area, true)
	area.owner = active_scene
	
