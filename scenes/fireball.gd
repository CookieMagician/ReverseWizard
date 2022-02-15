extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RigidBody2D_body_entered(body):
	$AnimatedSprite.animation = "death"
	mode = RigidBody2D.MODE_STATIC


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "death":
		queue_free()

