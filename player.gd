extends CharacterBody2D

signal death

var health = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	var happyBoo = $HappyBoo
	if velocity.length() > 0.0:
		happyBoo.play_walk_animation()
	else:
		happyBoo.play_idle_animation()
	
	const DAMAGE = 50.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			death.emit()
	
