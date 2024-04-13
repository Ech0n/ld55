class_name FireCreature
extends "EnemyInterface.gd"

@export var Bullet : PackedScene

func _init():
	speed = 15.0
	player = null
	in_attack_range = false
	curr_health = 200
	attack_cooldown = 40
	damage = 50


func attack_player():
	if curr_attack_cooldown == 0:
		var bullet = Bullet.instantiate()
		bullet.damage = damage # Might reconsider just setting it up at projectile _init
		add_child(bullet)
		bullet.set_target(position.direction_to(player.position))
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1
