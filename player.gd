extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	var happyBoo = $HappyBoo
	if velocity.length() > 0.0:
		happyBoo.play_walk_animation()
	else:
		happyBoo.play_idle_animation()
	pass
