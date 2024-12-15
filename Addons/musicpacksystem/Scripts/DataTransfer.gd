extends Node2D
class_name Audio_transfere
@export var theme:AudioStreamInteractive 
@export var mood:int 
@export var volume=0
@export var pitch = 0
@export var audio_bus= 0

var ASP:AudioStreamPlayer

var default_music: Default_Music

func _on_body_entered(body: Node2D) -> void:
	print("Enter body")
	for I in get_parent().get_children():
		if I is Default_Music:
			default_music = I
			ASP = default_music.Audio_stream
			break
	#for I in body.get_children():
		#if  I is AudioStreamPlayer:
			#ASP =  I
			#break 
			#Not used in current project, could be used later again when changing items
	if ASP.stream != theme:
		ASP.stream = theme
		ASP.play()
	if default_music.current_playing_index != mood:
		ASP.get_stream_playback().switch_to_clip(mood)
		default_music.current_playing_index = mood

	if ASP.stream == null:
		for I in get_parent().get_children():
			if I is Default_Music:
				default_music = I
		if default_music != null:
			ASP.stream = default_music.theme
			ASP.play()
			if default_music.current_playing_index != mood:
				ASP.get_stream_playback().switch_to_clip(default_music.mood)
				default_music.current_playing_index = default_music.mood
	
		
	
	


func _on_body_exited(body: Node2D) -> void:
	print("Exit body")
	for I in get_parent().get_children():
		if I is Default_Music:
			default_music = I
			break
	if default_music != null:
		for I in body.get_children():
			if  I is AudioStreamPlayer:
				ASP = I
				break
			if ASP.stream== default_music.theme:
				if default_music.current_playing_index == default_music.mood:
					pass
				else:
					ASP.get_stream_playback().switch_to_clip(default_music.mood)
					default_music.current_playing_index = default_music.mood
			else:
				ASP.stream =default_music.theme
				ASP.play()
				ASP.get_stream_playback().switch_to_clip(default_music.mood)
				default_music.current_playing_index = default_music.mood
		
