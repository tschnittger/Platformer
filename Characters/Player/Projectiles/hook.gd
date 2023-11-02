extends CharacterBody2D


const SPEED = 1300.0
var _range = 500

var _direction
var x
var y 
var shooting = false
var distance = 0
var damage
var start_point
var chain_distance = 0


func shoot(start, end, dmg):
	if end.x > start.x:
		_direction = end - start
		get_node("SpecialBarrel4Outline").flip_v = false
		$Hookpoint.global_position = Vector2(-14.142, 11.314)
		look_at(_direction)
	else:
		_direction = end - start
		get_node("SpecialBarrel4Outline").flip_v = true
		$Hookpoint.global_position = Vector2(14.142, -11.314)
		look_at(_direction * -1)
	shooting = true
	damage = dmg
	start_point = start

func _physics_process(delta):
	distance = int(global_position.distance_to(start_point))
	if shooting:
		if distance < _range:
			_direction = _direction.normalized()
			velocity.x = _direction.x*SPEED
			velocity.y = _direction.y*SPEED
			move_and_slide()
		else:
			queue_free()


func _on_area_2d_body_entered(body):
	if "frog" in body.name and shooting:
		body.curr_hp -= damage
		body._handle_combat()
	shooting = false
	
	
