extends Area2D


var p_speed = 450
var lifetime = 2.0
var time = 0.0
var startPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	startPosition = position

func _process(delta):
	position.y += p_speed * delta
	time += delta
	if time >= lifetime:
		self.queue_free()



func _on_Projectile1_body_entered(body):
	if body.name == "Player":
		self.queue_free()
