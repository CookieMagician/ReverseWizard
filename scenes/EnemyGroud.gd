extends Node2D

var enemy = preload("res://scenes/enemy.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	pass

var rng = RandomNumberGenerator.new()
func _on_Timer_timeout():
	var enemy_instance = enemy.instance();
	
	rng.randomize()
	var randNum = rng.randi_range(0, 4)

	if randNum == 0:
		enemy_instance.position = $enemyPointNorth.get_global_position()
		get_tree().get_root().add_child(enemy_instance)
	elif randNum == 1:
		enemy_instance.position = $enemyPointSouth.get_global_position()
		get_tree().get_root().add_child(enemy_instance)
	elif randNum == 2:
		enemy_instance.position = $enemyPointWest.get_global_position()
		get_tree().get_root().add_child(enemy_instance)
	elif randNum == 3:
		enemy_instance.position = $enemyPointEast.get_global_position()
		get_tree().get_root().add_child(enemy_instance)
	
