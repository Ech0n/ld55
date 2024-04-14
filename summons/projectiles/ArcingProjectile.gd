class_name ArcingProjectile
extends "ProjectileInterface.gd"

func _init():
	speed = 120.0
	time_to_live = 3.0
	is_friendly = false

@export var rotation_speed : float = 80.0

func _physics_process(delta):
	if target_dir != Vector2.ZERO:
		var angle_to_rotate = rotation_speed * delta
		target_dir = target_dir.rotated(deg_to_rad(angle_to_rotate))
		position += target_dir * speed * delta

	time_since_start += delta
	if time_since_start > time_to_live:
		queue_free()
