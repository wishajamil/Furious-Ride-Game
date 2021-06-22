extends Node


var highscore = 0;
var EnemyCount = 0;
var rand = RandomNumberGenerator.new()
var mainscene = load("res://MainEnemy.tscn")
var mainscene2 = load("res://Enemy2.tscn")
var mainscene3 = load("res://Enemy3.tscn")
func _ready():
	for i in range(0,3):
		var enemy = mainscene.instance()
		rand.randomize()
		var x = rand.randf_range(310, 710)
		rand.randomize()
		var y = rand.randf_range(50, 100)
		enemy.position.y = y 
		enemy.position.x = x
		add_child(enemy)
		#EnemyCount = get_children().size()
		

func _on_EnemyTimer_timeout():
	#Main Enemy
	for i in range(0,3):
		var enemy = mainscene.instance()
		rand.randomize()
		var x = rand.randf_range(310, 710)
		rand.randomize()
		var y = rand.randf_range(-100, 50)
		enemy.position.y = y 
		enemy.position.x = x
		add_child(enemy)
		
		
		#enemy2
	for i in range(0,1):
		var enemy2 = mainscene2.instance()
		rand.randomize()
		var x = rand.randf_range(310, 710)
		rand.randomize()
		var y = rand.randf_range(-100, 50)
		enemy2.position.y = y 
		enemy2.position.x = x
		add_child(enemy2)
		
		#enemy3
	for i in range(0,1):
		var enemy3 = mainscene3.instance()
		rand.randomize()
		var x = rand.randf_range(310, 710)
		rand.randomize()
		var y = rand.randf_range(-100, 50)
		enemy3.position.y = y 
		enemy3.position.x = x
		add_child(enemy3)
