class_name Summon
extends "AllyInterface.gd"

func _init():
	damage = 10.0
	speed = 3.0
	attack_cooldown = 30.0
	looseness = 2.0

static func new_summon(num) -> Summon:
	var summon_scene: PackedScene = load("res://summons/Summon.tscn")
	var new_summon: Summon = summon_scene.instantiate()
	new_summon.summon_slot = num
	return new_summon
