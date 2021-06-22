extends KinematicBody2D

#var score= preload("res://Scoreboard.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bullet = preload("res://EnemyProjectile.tscn")
var shotInterval = 1.5
var shotTimer = 0
var time = 0.0
var speed = 50
var velocity = Vector2()
var randomFloat = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomFloat = rand_range(.5, 1)

func _process(delta):
	
	time += delta #Shooting: This is a timer.
	if time >= shotTimer:
		shoot()
		shotTimer += shotInterval #Shooting: This code checks the timer to see if the enemy can shoot.
	position.y += (400 * randomFloat) * delta #Movement: This handles the enemy's y movement.
	#velocity = 400	
	#global_position = 400

func shoot():
	var shot = bullet.instance()
	if owner == null:
		get_parent().add_child(shot)
	else:
		owner.add_child(shot)
	shot.position = position
	



func _on_Area2D_body_entered(body):
	if body.name == "Projectile":
		#$Scoreboard/StaticBody2D/Score.text= "HIGHSCORE: "+ str(highscore)
		queue_free()
		
		Game.highscore += 100;
		#print(highscore);


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
