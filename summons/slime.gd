class_name Slime
extends "MeleeEnemyInterface.gd"

func _init():
	speed = 50.0
	player = null
	in_attack_range = false
	curr_health = 50
	attack_cooldown = 0
	damage = 10
