extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal gameOver

export (int) var speed = 400
export (int) var health = 100

const gravity = 100

var JUMP = true
var alive = true

onready var bigman = $ "../world"
onready var HealthBar = $ "../HUD/HealthBar"


func _ready():
	var world = get_tree().get_root()
	world.connect("gameOver", self, "pause")

func pause():
	pass

var velocity = Vector2()

func getInput():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	velocity = velocity.normalized() * speed
	
	



func _physics_process(delta):
	if alive: 
		getInput()
		velocity = move_and_slide(velocity, Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func damage(damage):
	if alive :
		health -= damage
		HealthBar.value -= damage
		print(health)
		if health <= 0:
			die()
			


func die():
	alive = false
	emit_signal("gameOver")
	
