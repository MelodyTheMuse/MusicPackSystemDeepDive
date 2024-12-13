extends Node
class_name Default_Music
@export var theme:AudioStreamInteractive
@export var mood:int
@onready var Audio_stream:AudioStreamPlayer = $AudioStreamPlayer
var current_playing_index = -1
func _ready():
	Audio_stream.stream = theme
	Audio_stream.play()
	Audio_stream.get_stream_playback().switch_to_clip(mood)
	current_playing_index = mood
