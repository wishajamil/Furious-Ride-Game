extends Button
var MainLevel = "res://MainLevel.tscn"

func _ready():
	pass
	
func _on_StartButton_pressed():
	get_tree().change_scene(MainLevel)
