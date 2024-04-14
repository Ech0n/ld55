class_name Chomper
extends "EnemyInterface.gd"

func _init():
	speed = 8.0
	player = null
	in_attack_range = false
	curr_health = 500
	attack_cooldown = 100
	damage = 150
