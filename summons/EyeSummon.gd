class_name EyeSummon
extends "AllyInterface.gd"

func _init():
	damage = 5.0
	speed = 5.0
	attack_cooldown = 50.0
	projectile_amount = 5
	looseness = 3.0
	spread_angle = 7.5

static func new_summon(num) -> EyeSummon:
	var eye_scene: PackedScene = load("res://summons/EyeSummon.tscn")
	var new_eye: EyeSummon = eye_scene.instantiate()
	new_eye.summon_slot = num
	return new_eye
