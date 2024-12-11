@tool
extends Control
var active_scene:Node
@onready var theme_script = $"GridContainer/OptionButton-Theme"
@onready var mood_script = $"GridContainer/OptionButton-Mood"
@onready var DTO = Audio_transfere.new()
var area:Area2D 
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
		print(active_scene.get_children())
		if I is DynamicStream :
			AP = I
			print("AP found")
			theme_script.audio_player_node = AP
			break
	
func DTO_Update():
	
	DTO.theme = theme_script.get_audio_player()
	DTO.mood = mood_script.get_moood()
	print(DTO.theme)
	print(DTO.mood)
func set_collision_shape():
	shape
