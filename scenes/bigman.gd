extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var DeathLable = $ "HUD/DeathLable"
onready var DeathButton = $ "HUD/Button"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pause():
	DeathLable.text = "You Died Loser!"
	DeathLable.visible = true
	DeathButton.visible = true
	
	var logicNodes = get_tree().get_nodes_in_group("logic")
	for item in logicNodes:
		item.Pause()

func reset():
	var logicNodes = get_tree().get_nodes_in_group("logic")
	for item in logicNodes:
		item.die()
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_player_gameOver():
	DeathLable.text = "You Died Loser!"
	DeathLable.visible = true
	DeathButton.visible = true
	
	var logicNodes = get_tree().get_nodes_in_group("logic")
	for item in logicNodes:
		item.pause()
