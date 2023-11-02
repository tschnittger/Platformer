extends CharacterBody2D


const SPEED = 100.0
var curr_hp = 5
var alive = true
var attacking = false
var damage = 5
var xp_on_death = 100
var last_direction
var last_body
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta):
	# Add the gravity.
	if alive and !attacking:
		_handle_movement(delta)
		_handle_combat()
	elif attacking:
		_handle_combat()
	move_and_slide()
	if !anim.is_playing() and !alive:
		queue_free()
		
func _handle_combat():
	if attacking and anim.current_animation != "Attack" and alive:
		attack(last_body, last_direction)
	if curr_hp <= 0 or global_position.y > 1500:
		alive = false
		attacking = false
		anim.get_animation("Death").loop_mode = 0
		get_tree().current_scene.get_node("Player").xp_curr += xp_on_death
		anim.play("Death", -1.0, 1.0, false)

func _handle_movement(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	var move_rnd = randi_range(1, 100)
	if move_rnd == 1:
		velocity.x = 1 * SPEED
		get_node("AnimatedSprite2D").flip_h = false
		anim.play("Move")
	elif move_rnd == 2:
		velocity.x = -1 * SPEED
		get_node("AnimatedSprite2D").flip_h = true
		anim.play("Move")

func attack(body, dir):
	if anim.current_animation != "Attack":
		if dir == "Right": 
			get_node("AnimatedSprite2D").flip_h = false
		else:
			get_node("AnimatedSprite2D").flip_h = true
		anim.play("Attack")
		anim.queue("Idle")
		if attacking:
			body.hit(damage)

func _on_area_2d_body_entered(body):
	if "Player" in body.name:
		last_body = body
		var dir = body.global_position.x - global_position.x
		if dir > 0:
			last_direction = "Right"
			attack(body, "Right")
		else:
			last_direction = "Left"
			attack(body, "Left")
		attacking = true
	

func _on_area_2d_body_exited(body):
	if "Player" in body.name:
		attacking = false
