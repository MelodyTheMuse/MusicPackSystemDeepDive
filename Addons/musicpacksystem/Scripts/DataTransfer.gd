
extends Node2D
class_name Audio_transfere
@export var theme:AudioStreamInteractive 
@export var mood:int 
@export var volume=0
@export var pitch = 0
@export var audio_bus= 0

var ASP:AudioStreamPlayer
var max:float = 10

var default_theme:AudioStreamInteractive
var default_mood:int

func _on_body_entered(body: Node2D) -> void:
	print("Enter body")
	var index:float
	while index <= max :
		if  body.get_child(index) is AudioStreamPlayer:
			ASP =  body.get_child(index)
			break
	if ASP.stream == theme:
		ASP.get_stream_playback().switch_to_clip(mood)
		print("Mood set")
	else :
		ASP.stream = theme
		ASP.play()
		ASP.get_stream_playback().switch_to_clip(mood)
		
	
	


func _on_body_exited(body: Node2D) -> void:
	var index:float
	while index <= max :
		if  body.get_child(index) is AudioStreamPlayer:
			ASP = body.get_child(index)
			break
		if ASP.stream== default_theme:
			if ASP.stream.get_clip() == default_mood:
				pass
			else:
				ASP.get_stream_playback().switch_to_clip(default_mood)
		else:
			ASP.stream =default_theme
			ASP.play()
			ASP.get_stream_playback().switch_to_clip(mood)
		
