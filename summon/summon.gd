extends CharacterBody2D

@export
var SPEED : float = 500.0

@export
var player : Node2D

@export var Bullet : PackedScene

func shoot():
	var b = Bullet.instantiate()
	add_child(b)
	b.set_target(position.direction_to(get_global_mouse_position()))
	print(position)

func _physics_process(delta):
	if player:
		position = lerp(position, player.position +( Vector2.LEFT * 15) + (Vector2.UP * 8), delta)
	
	if Input.is_action_just_pressed("attack"):
		shoot()
		
