extends KinematicBody2D

var bomb = preload("res://EnemyBomb.tscn")
var bombInterval = 3
var bombTimer = 0
var time = 0.0
var speed = 50
var velocity = Vector2()
var randomFloat = 0.0


var highscore = 0;
var EnemyCount = 0;
var rand = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	randomFloat = rand_range(.5, 1)

func _process(delta):
	
	time += delta
	if time >= bombTimer:
		drop()
		bombTimer += bombInterval
	position.y += (150 * randomFloat) * delta 
	#velocity = 400	
	#global_position = 400

func drop():
	var bombdrop = bomb.instance()
	if owner == null:
		get_parent().add_child(bombdrop)
	else:
		owner.add_child(bombdrop)
	bombdrop.position = position
	


func _on_Area2D_body_entered(body):
	if body.name == "Projectile":
		#$Scoreboard/StaticBody2D/Score.text= "HIGHSCORE: "+ str(highscore)
		queue_free()
		
		Game.highscore += 100;
		#print(highscore);




