extends KinematicBody2D


var PlayerDirection = Vector2()
var PlayerDirection2 = Vector2()
var randomFloat = 0.0
var rand = RandomNumberGenerator.new()
var speed = 250
var motion = Vector2()
func _ready():
	randomFloat = rand_range(.5, 1)


func _physics_process(delta):
	motion = move_and_slide(motion)
	motion.y = speed *  PlayerDirection.y
	motion.x = speed * PlayerDirection.x



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		PlayerDirection = (body.global_position - self.global_position).normalized()
#		var Side = sign(body.global_position.x - self.global_position.x)
#		position.y += Side *(speed * 
		


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		PlayerDirection2 = (body.global_position - self.global_position).normalized()


func _on_Hurtbox_body_entered(body):
	if body.name == "Projectile":
		#$Scoreboard/StaticBody2D/Score.text= "HIGHSCORE: "+ str(highscore)
		queue_free()
		
		Game.highscore += 100;
		#print(highscore);
