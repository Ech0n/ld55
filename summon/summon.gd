extends CharacterBody2D

@export
var SPEED : float = 500.0

@export
var player : Node2D

func _physics_process(delta):
	global_transform.origin = lerp(global_transform.origin, player.transform.origin, delta)
	
