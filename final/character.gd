extends CharacterBody2D

@onready var smp: Node = $StateMachinePlayer

const SPEED = 110.0

func _ready():
	Global.player = self

#Global.stats

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
	
	smp.set_param('moving', (abs(direction) + abs(direction2)) != 0)
	match curr_state: 
		"standing":
			standing()
		"walking":
			walking()
		'attack':
			attack()
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction2:
		velocity.y = direction2 * SPEED
		
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	
	move_and_slide()

func walking():
	$AnimatedSprite2D.play('walking right')
	pass
	
func attack():
	print("bang")
	if $AnimatedSprite2D.animation != 'attack right':
		$AnimatedSprite2D.play('attack right')
	pass
	
func death():
	pass
	
func standing():
	$AnimatedSprite2D.play('standing')
	pass

func damage():
	

func _input(event: InputEvent) -> void:
	
	
	if event is InputEventKey and event.pressed and event.keycode == 32:
		smp.set_trigger('attack')
		


func _on_hitbox_area_entered(area: Area2D) -> void:
	print("player area entered")
	pass # Replace with function body.


func _on_hitbox_body_entered(body: Node2D) -> void:
	print('player body entered')
	pass # Replace with function body.

var curr_state
func _on_state_machine_player_updated(state: Variant, delta: Variant) -> void:
	curr_state = state 
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == 'attack right':
		smp.set_trigger('attack end')
	pass # Replace with function body.
