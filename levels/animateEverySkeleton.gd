extends Node2D


func _ready():
	for c in get_children():
		if c.has_method("play"):
			c.play("walk")
