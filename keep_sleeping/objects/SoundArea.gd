extends Area2D

var is_inside_the_area := false

func _on_body_entered(body) -> void:
	is_inside_the_area = true


func _on_body_exited(body) -> void:
	is_inside_the_area = false

func _process(delta: float) -> void:
	if is_inside_the_area:
		print("Inside!")
