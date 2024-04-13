extends Area2D

var speed : float = 0
var target
var target_dir
var time_to_live : float = 0
var damage : float = 0
var is_friendly : bool = false

@onready var time_since_start = 0

func _physics_process(delta):
	if target_dir:
		position += target_dir * speed * delta
	time_since_start += delta
	
	if time_since_start > time_to_live:
		queue_free()


func set_target(target_direction):
	target_dir = target_direction


func _on_body_entered(body):
	var targeted_group : String = "enemy" if is_friendly else "player"
	if body.is_in_group(targeted_group):
		body.take_damage(damage)
	queue_free()
