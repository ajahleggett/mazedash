extends CharacterBody2D


const SPEED = 170.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	

	# Handle jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	var direction := Input.get_axis("ui_left", "ui_right")
	var direction2 :=  Input.get_axis("ui_up", "ui_down")
	if direction > 0: 
		$AnimatedSprite2D.flip_h = false
	elif direction < 0: 
		$AnimatedSprite2D.flip_h = true
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction2:
		velocity.y = direction2 * SPEED
		
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
