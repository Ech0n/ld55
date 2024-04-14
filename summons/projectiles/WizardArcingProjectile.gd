class_name WizardArcingProjectile
extends "ProjectileInterface.gd"

func _init():
	speed = 160.0
	time_to_live = 4.5
	is_friendly = false

func _physics_process(delta):
	if target_dir != Vector2.ZERO:
		var angle_to_rotate = rotation_speed * delta
		target_dir = target_dir.rotated(deg_to_rad(angle_to_rotate))
		position += target_dir * speed * delta

	time_since_start += delta
	if time_since_start > time_to_live:
		queue_free()
