class_name Wizard
extends "EnemyInterface.gd"

@export var HomingBullet : PackedScene
@export var ArcingBullet : PackedScene
@export var NormalBullet : PackedScene

var credits = preload("res://levels/Credits.tscn").instantiate()

func _init():
	speed = 0.25
	curr_health = 5000
	is_ranged = true
	thorns_damage = 3


@export var homing_attack_cooldown : float = 250.0
@export var ring_attack_cooldown : float = 200.0
@export var main_attack_cooldown : float = 150.0
@export var homing_attack_damage : float = 50.0
@export var ring_attack_damage : float = 100.0
@export var main_attack_damage : float = 150.0

var curr_homing_attack_cooldown : float = 0.0
var curr_ring_attack_cooldown : float = 0.0
var curr_main_attack_cooldown : float = 0.0
var rot_speed : float = 60.0
var ring_attack_counter : int = 0


func take_damage(damage : float):
	curr_health -= damage
	particleManager.restart()
	if curr_health <= 0:
		get_tree().get_root().add_child(credits)
		queue_free()


func attack_player():
	if curr_homing_attack_cooldown == 0:
		var num_projectiles = 8
		var spread_angle = 360 / num_projectiles
		
		for i in range(num_projectiles):
			var bullet = HomingBullet.instantiate() 
			bullet.damage = homing_attack_damage
			add_child(bullet)
			var angle_offset = spread_angle * i
			var direction = Vector2.RIGHT.rotated(deg_to_rad(angle_offset))
			bullet.set_target(direction)
		
		curr_homing_attack_cooldown = homing_attack_cooldown
	else:
		curr_homing_attack_cooldown -= 1
	
	if curr_ring_attack_cooldown == 0:
		var num_projectiles = 24
		var spread_angle = 360 / num_projectiles
		
		for i in range(num_projectiles):
			if ring_attack_counter == 2:
				rot_speed *= -1
			
			var bullet = ArcingBullet.instantiate() 
			bullet.damage = ring_attack_damage
			bullet.rotation_speed = rot_speed
			add_child(bullet)
			var angle_offset = spread_angle * i
			var direction = Vector2.RIGHT.rotated(deg_to_rad(angle_offset))
			bullet.set_target(direction)
		
		if ring_attack_counter == 2:
			ring_attack_counter = 0
		else:
			ring_attack_counter += 1
		
		rot_speed = rot_speed * -1
		curr_ring_attack_cooldown = ring_attack_cooldown
	else:
		curr_ring_attack_cooldown -= 1
	
	if curr_main_attack_cooldown == 0:
		var spread_angle = 2.0
		
		for i in range(5):
			var bullet = NormalBullet.instantiate() 
			bullet.damage = main_attack_damage 
			add_child(bullet)

			var angle_offset = spread_angle * (i - 1)
			var direction = position.direction_to(player.position).rotated(deg_to_rad(angle_offset))
			
			bullet.set_target(direction)
		curr_main_attack_cooldown = main_attack_cooldown
	else:
		curr_main_attack_cooldown -= 1

