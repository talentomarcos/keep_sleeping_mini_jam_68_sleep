extends KinematicBody2D

export(float, 1.0, 500.0, 0.1) var max_speed = 200.0
export(float, 1.0, 500.0, 0.1) var jump_force = 200.0
export(float, 1.0, 500.0, 0.1) var gravity_force = 400.0
export(float, 1.0, 2000.0, 0.1) var max_fall_speed = 1000.0


var velocity := Vector2.ZERO

func get_inputs() -> void:
	velocity.x = Input.get_action_strength('right') - Input.get_action_strength('left')
#    if Input.is_action_pressed('down'):
#        velocity = Vector2(-speed, 0).rotated(rotation)
#    if Input.is_action_pressed('up'):
#        velocity = Vector2(speed, 0).rotated(rotation)
	velocity.x *= max_speed

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		jump()

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	get_inputs()
#	rotation += rotation_dir * rotation_speed * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)

func jump() -> void:
	velocity.y = -jump_force

func apply_gravity(delta: float) -> void:
	velocity.y += gravity_force * delta if not is_on_floor() else 0.0
#	velocity.y = clamp(velocity.y, gravity_force, max_fall_speed)
