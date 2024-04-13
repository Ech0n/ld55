class_name Chomper
extends "MeleeEnemyInterface.gd"

func _init():
	speed = 15.0
	player = null
	in_attack_range = false
	curr_health = 200
	attack_cooldown = 100
	damage = 50
