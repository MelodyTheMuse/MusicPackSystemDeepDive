@tool
extends Node2D
class_name Audio_transfere
@export var theme:AudioStreamInteractive 
@export var mood = 0
@export var volume = 0
@export var pitch = 0
@export var audio_bus= 0
var ASP:AudioStreamPlayer
var max:float = 10
func modify_player():
	pass
	





func _on_body_entered(body: Node2D) -> void:
	print("Enter body")
	var index:float
	while index <= max :
		if  body.get_child(index) is AudioStreamPlayer:
			ASP =  body.get_child(index)
			break
	ASP.stream = theme
	ASP.play()
	
