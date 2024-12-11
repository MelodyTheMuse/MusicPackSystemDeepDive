@tool
extends Node2D
class_name DynamicStream
@export var ASP = AudioStreamPlayer.new()
signal PlayerUsable(asp)

func _ready():
	print("AudioReady")
	emit_signal("PlayerUsable",ASP)
