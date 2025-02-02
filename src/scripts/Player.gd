#Script controls player character
extends Entity

func _physics_process(delta: float) -> void:
	
	var direction: = get_direction()
	velocity = calculate_move_velocity(velocity, direction, speed)
	velocity = move_and_slide(velocity, Vector2.UP)

#Function that is used to find out what direction we want the player to move
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("move_up") and is_on_floor() else 1.04
	)
	


#Function to calculate the velocity of the player
func calculate_move_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	
	#if jumping
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	
	return new_velocity
