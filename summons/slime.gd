class_name Slime
extends "EnemyInterface.gd"

func _init():
	speed = 1.2
	player = null
	in_attack_range = false
	curr_health = 50
	attack_cooldown = 50
	damage = 10
