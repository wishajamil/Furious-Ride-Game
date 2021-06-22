extends RichTextLabel

var ms = 0;
var s = 60;
const WinScreen = preload("res://WinScreen.tscn")

func _process(delta):
		var win = WinScreen.instance()
		if(ms > 9):
			s -= 1
			ms = 0
		set_text("Time: "+str(s)+":"+str(ms))
		
		if (s == 0):
			s = 0
			ms = 0
			add_child(win)
		#if(Game.highscore == 500):
		#	set_text("You Win!")
		
		
func _on_Timer_timeout():
	ms += 1;
	pass # Replace with function body.
