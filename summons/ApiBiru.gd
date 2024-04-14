class_name ApiBiru
extends "EnemyInterface.gd"

@export var Bullet : PackedScene


func _init():
	speed = 1.0
	curr_health = 300
	attack_cooldown = 30
	damage = 60
	is_ranged = true
	thorns_damage = 10


func attack_player():
	if curr_attack_cooldown == 0:
		var spread_angle = 10
		
		for i in range(3):
			var bullet = Bullet.instantiate() 
			bullet.damage = damage 
			add_child(bullet)

			var angle_offset = spread_angle * (i - 1)
			var direction = position.direction_to(player.position).rotated(deg_to_rad(angle_offset))
			
			bullet.set_target(direction)
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1
