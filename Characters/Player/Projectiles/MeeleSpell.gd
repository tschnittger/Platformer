extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction 
var damage = 2
var shooting = false

@onready var anim = get_node("AnimationPlayer")

func shoot(dir):
	direction = dir

func _physics_process(delta):
	if shooting:
		if !anim.is_playing():
			queue_free()
		move_and_slide()
	else:
		anim.play("Shooting")
		shooting = true


func _on_area_2d_body_entered(body):
	if "frog" in body.name:
		body.curr_hp -= damage
		body._handle_combat()
		shooting = false
