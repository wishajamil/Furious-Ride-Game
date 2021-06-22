extends KinematicBody2D

var StartScreen = "res://StartScreen.tscn"
var Hits = 0
var motion = Vector2()
var highscore = 0;
var prog = 100;
onready var ParticleMaterial = $RightParticle.process_material #This is the process material for the tire particles

const GameOverScreen = preload("res://OverScreen.tscn")

var projectile2 = preload("res://Projectile1.tscn")
const SPEED  = 350
const UP = Vector2(0,-1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _exit_tree():
	pass
	
func _process(delta):
	#if Input.is_action_just_pressed("ui_accept"):
	#	shoot()
	#	var musicNode = $"Audio_Effect/bullets"
	#	musicNode.play()
	
	if Input.is_action_just_pressed("Fire2"):
		shoot2()
		highscore += 100;
		var musicNode = $"Audio_Effect/bullets"
		musicNode.play()
		#$Node/StaticBody2D/Score.text= "HIGHSCORE: "+ str(highscore)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	move()
	motion = move_and_slide(motion)
	
func move():
	if Input.is_action_pressed("ui_right")&& !Input.is_action_pressed("ui_left"):
		var musicNode = $"Audio_Effect/carDriving"
		musicNode.play()
		motion.x = SPEED
		ParticleMaterial.gravity.x = -500 #Particles: This changes which direction the particles will go.
		
	elif Input.is_action_pressed("ui_left")&& !Input.is_action_pressed("ui_right"):
		var musicNode = $"Audio_Effect/carDriving"
		musicNode.play()
		motion.x = -SPEED
		ParticleMaterial.gravity.x = 500
		
	else:
		motion.x = 0
		ParticleMaterial.gravity.x = 0
	
	if Input.is_action_pressed("ui_up")&& !Input.is_action_pressed("ui_down"):
		var musicNode = $"Audio_Effect/carDriving"
		musicNode.play()
		motion.y = -SPEED
		ParticleMaterial.gravity.y = 1000 #Particles: X and Y are affected independent of each other.
	elif Input.is_action_pressed("ui_down")&& !Input.is_action_pressed("ui_up"):
		var musicNode = $"Audio_Effect/carDriving"
		musicNode.play()
		motion.y = SPEED
		ParticleMaterial.gravity.y = 50
	else:
		motion.y = 0
		ParticleMaterial.gravity.y = 200
	

func shoot2():
	var bullet2 = projectile2.instance()
	bullet2.position = get_global_position()
	get_parent().add_child(bullet2)
	#highscore += 100;
	#print(highscore);
	

func _on_Area2D_area_shape_entered(area_id, area, area_shape, local_shape):
	var game_over = GameOverScreen.instance()
	if area.name == "EnemyProjectile":
		#Hits = Hits + 1
		prog -= 20;
		#print(Hits)

	if area.name == "EnemyBomb":
		#Hits = Hits + 1
		prog -= 20;
		#print(Hits)
	if prog <=0:
			get_parent().add_child(game_over)
	if area.name == "Hurtbox":
		prog -= 20;
