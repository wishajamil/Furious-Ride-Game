extends Label

func _process(delta):
	text = "Highscore: " + String(Game.highscore)
