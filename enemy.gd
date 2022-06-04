extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player
var move = Vector2.ZERO
export var speed = 2
export (int) var damage = 25
export (int) var health = 100
var angle_to = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("House")[0]
	pass # Replace with function body.


func set_anim():
	angle_to = position.angle_to_point(player.position)
	if angle_to > -0.5 and angle_to < 0.5 :
		$AnimatedSprite.animation = "1"
	elif angle_to < -1 and angle_to > -2 :
		$AnimatedSprite.animation = "7"
	elif angle_to > 1 and angle_to < 2:
		$AnimatedSprite.animation = "2"
	elif angle_to > 2 and angle_to < 2.75:
		$AnimatedSprite.animation = "4"
	elif (angle_to > 2.75 and angle_to < 3) and (angle_to < -2.75 and angle_to > -3):
		$AnimatedSprite.animation = "5"
	
	

func pause():
	pass

func _process(delta):
	
	if is_instance_valid(player):
		move = position.direction_to(player.position)
		move = move.normalized() * speed
		move = move_and_collide(move)
		set_anim()
	else: 
		player = get_tree().get_nodes_in_group("House")[0]

func move():
	pass

func damage(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()
	
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Got the playe!!!!\n")
		body.damage(damage)
	if body.is_in_group("play-projectile"):
		damage(25)
	
