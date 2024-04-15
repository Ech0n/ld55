extends Node2D

signal _on_restart_game

@onready
var player = $Player

#This ensures that player dead signal is recieved only once and that the game dosent bug out
var isPlayerDead = false

var boss = preload("res://levels/bossManWizard.tscn").instantiate()

func _on_player__on_dead():
	if !isPlayerDead:
		_on_restart_game.emit()
		isPlayerDead = true


func _on_lava_land__on_portal_used():
	add_child(boss)
	player.position = Vector2.ZERO
	$LavaLand.queue_free()
	await $LavaLand.tree_exited
