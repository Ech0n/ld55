class_name TreeMonster
extends "EnemyInterface.gd"

@export var Bullet : PackedScene


func _init():
	speed = 0.5
	curr_health = 300
	attack_cooldown = 100
	damage = 30
	is_ranged = true


func attack_player():
	if curr_attack_cooldown == 0:
		var num_projectiles = 20
		var spread_angle = 360 / num_projectiles
		
		for i in range(num_projectiles):
			var bullet = Bullet.instantiate() 
			bullet.damage = damage
			add_child(bullet)
			var angle_offset = spread_angle * i
			var direction = Vector2.RIGHT.rotated(deg_to_rad(angle_offset))
			bullet.set_target(direction)
		
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1

