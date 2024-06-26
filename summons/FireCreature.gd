class_name FireCreature
extends "EnemyInterface.gd"

@export var Bullet : PackedScene

func _init():
	speed = 0.5
	curr_health = 125
	attack_cooldown = 40
	damage = 50
	is_ranged = true
	thorns_damage = 5


func attack_player():
	if curr_attack_cooldown == 0:
		var bullet = Bullet.instantiate()
		bullet.damage = damage # Might reconsider just setting it up at projectile _init
		add_child(bullet)
		bullet.set_target(position.direction_to(player.position))
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1
