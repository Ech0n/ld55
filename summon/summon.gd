extends CharacterBody2D

@export
var SPEED : float = 500.0

@export
var player : Node2D

@export var Bullet : PackedScene

func shoot():
	var b = Bullet.instantiate()
	add_child(b)
	b.transform = transform

func _physics_process(delta):
	global_transform.origin = lerp(global_transform.origin, player.transform.origin, delta)
	
	if Input.is_action_just_pressed("attack"):
		shoot()
