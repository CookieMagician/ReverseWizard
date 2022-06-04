extends Sprite

var fireball = preload("res://scenes/fireball.tscn")

var can_fire = true

export (float) var delay = 0.1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func iput_handler():
	
	if Input.is_action_pressed("fire") and can_fire:
		var fireball_instance = fireball.instance();
		fireball_instance.position = $fire_point.get_global_position()
		fireball_instance.rotation_degrees = rotation_degrees
		fireball_instance.apply_impulse(Vector2(), Vector2(1000, 0).rotated(rotation))
		get_tree().get_root().add_child(fireball_instance)
		can_fire = false
		yield(get_tree().create_timer(delay), "timeout")
		can_fire = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	iput_handler()
	look_at(get_global_mouse_position())
