extends Area2D

var Menemy = preload("res://MainEnemy.tscn")
var p_speed = -450
var time = .75
var highscore = 0;

func _ready():
	Removal()


func _process(delta):
	position.y += p_speed * delta
	
func Removal():
	yield(get_tree().create_timer(time),"timeout")
	queue_free()


func _on_Projectile1_body_entered(body):
	if body.name == "Enemy":
		
		self.hide()
	 
		
		#highscore += 100;
		#$Node/StaticBody2D/Score.text= "HIGHSCORE: "+ str(highscore)
	
