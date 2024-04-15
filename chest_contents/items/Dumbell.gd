class_name Dumbell
extends Item

func _init():
	itemName = "Dumbell"
	texture = load("res://assets/aseprite/Items/dumbell.png")
	itemDescription = "Get stronger and deal more damage"
func collect(player):
	player.sword_damge += 5
	print(player.sword_damge)
