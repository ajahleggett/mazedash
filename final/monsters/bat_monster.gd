extends CharacterBody2D


@export var movement_speed = 90.0
const JUMP_VELOCITY = -400.0
@onready var nav: NavigationAgent2D = $NavigationAgent2D


func _physics_process(delta: float) -> void:
	if Global.player:
		nav.target_position = Global.player.global_position
		var next_pos = nav.get_next_path_position()
		velocity = global_position.direction_to(next_pos) * movement_speed
	# Add the gravity.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
