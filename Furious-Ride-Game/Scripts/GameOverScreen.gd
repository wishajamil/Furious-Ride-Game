extends Sprite

var MainLevel = "res://MainLevel.tscn"

func _on_PlayAgainButton_pressed():
	get_tree().change_scene(MainLevel)

func _on_QuitButton_pressed():
	get_tree().quit()
