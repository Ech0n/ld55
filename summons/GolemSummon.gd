class_name GolemSummon
extends "AllyInterface.gd"

func _init():
	damage = 0.0
	speed = 6.0
	looseness = 0.75
	blocks_enemy_projectiles = true

static func new_summon(num) -> GolemSummon:
	var golem_scene: PackedScene = load("res://summons/GolemSummon.tscn")
	var new_golem: GolemSummon = golem_scene.instantiate()
	new_golem.summon_slot = num
	return new_golem
