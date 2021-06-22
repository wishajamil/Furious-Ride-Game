extends Sprite

var Speed = 1000
var StartPos = Vector2.ZERO

func _ready():
	StartPos = global_position #This is used to reset the picture and determine how far the picture can go before resetting.

func _process(delta):
	global_position.y += Speed * delta
	if global_position.y >= StartPos.y + (480 * self.scale.y): #This checks to see if the picture is passed the border of the first picture.
		global_position.y = StartPos.y #This resets the picture back to the original starting position.
