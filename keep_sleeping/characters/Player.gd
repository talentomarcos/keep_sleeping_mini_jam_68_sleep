extends KinematicBody2D

export(float) var max_speed = 200.0

var velocity := Vector2.ZERO

func get_inputs():
	velocity = Vector2.ZERO
	
	velocity.x = Input.get_action_strength('right') - Input.get_action_strength('left')
#    if Input.is_action_pressed('down'):
#        velocity = Vector2(-speed, 0).rotated(rotation)
#    if Input.is_action_pressed('up'):
#        velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_inputs()
#	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity * max_speed)
