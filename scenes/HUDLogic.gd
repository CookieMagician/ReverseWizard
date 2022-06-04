extends CanvasLayer

signal reset
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	var nodes = get_tree().get_nodes_in_group("logic")
	
	for node in nodes:
		node.die()
		
	get_tree().reload_current_scene()
		
	
	
