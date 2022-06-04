extends Light2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var diff

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = -8771
	diff = position.x + 10500
# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (position.x >= 10500):
		position.x = -8771
	else: 
		position.x += diff / 100
