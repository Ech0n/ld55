extends Node2D

signal _on_portal_used

func _on_boss_fight_portal__on_portal_used():
	_on_portal_used.emit()

