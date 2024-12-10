@tool
extends OptionButton
@export var list_themes = []
@export var MoodBox = OptionButton.new()
func _on_ready():
	for I in range(list_themes.size()):
		self.add_item(list_themes[I].get_name())

func _on_item_selected(index: int) -> void:
	MoodBox.clear()
	var theme = list_themes[index] 
	if theme.clip_count != 0:
		for I in range(theme.clip_count):
			MoodBox.add_item(theme.get_clip_name(I))
