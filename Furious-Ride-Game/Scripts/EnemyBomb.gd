extends Area2D


var p_speed = 250
var time = 2
var startPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	startPosition = position
	Removal()

func _process(delta):
	position.y += p_speed * delta
	

func Removal():
	yield(get_tree().create_timer(time),"timeout")
	queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		self.queue_free()
