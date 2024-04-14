class_name AngelSummon
extends "AllyInterface.gd"

func _init():
	damage = 50.0
	speed = 15.0
	attack_cooldown = 20.0
	projectile_amount = 10
	looseness = 1.5
	spread_angle = 3.0
	blocks_enemy_projectiles = true

static func new_summon(num) -> AngelSummon:
	var angel_scene: PackedScene = load("res://summons/AngelSummon.tscn")
	var new_angel: AngelSummon = angel_scene.instantiate()
	new_angel.summon_slot = num
	return new_angel
