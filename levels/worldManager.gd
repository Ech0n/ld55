extends Node2D

signal _on_restart_game

#This ensures that player dead signal is recieved only once and that the game dosent bug out
var isPlayerDead = false

func _on_player__on_dead():
	if !isPlayerDead:
		_on_restart_game.emit()
		isPlayerDead = true
