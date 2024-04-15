extends Node2D

signal on_intro_finished

func _on_animation_player_animation_finished(anim_name):
	on_intro_finished.emit()
