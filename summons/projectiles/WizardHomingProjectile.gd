class_name WizardHomingProjectile
extends "ProjectileInterface.gd"

func _init():
	speed = 125.0
	time_to_live = 4.0
	is_friendly = false
	rotation_speed = 200.0

var target_node : Node

func _ready():
	target_node = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if target_node:
		var target_position = target_node.global_position
		var current_position = global_position
		var desired_direction = (target_position - current_position).normalized()

		var current_angle = target_dir.angle()
		var desired_angle = desired_direction.angle()

		var new_angle = lerp_angle(current_angle, desired_angle, rotation_speed * delta / 180.0 * PI)
		target_dir = Vector2(cos(new_angle), sin(new_angle))

		position += target_dir * speed * delta

	time_since_start += delta
	if time_since_start > time_to_live:
		queue_free()
