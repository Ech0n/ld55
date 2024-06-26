class_name HomingProjectile
extends "ProjectileInterface.gd"

func _init():
	speed = 75.0
	time_to_live = 3.0
	is_friendly = false
	rotation_speed = 150.0

var target_node : Node 

@onready
var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	target_node = player

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
