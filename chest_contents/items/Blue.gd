class_name Blue
extends Item

func _init():
	itemName = "Blue Potion"
	texture = load("res://assets/aseprite/Items/blue_pot.png")

func collect(player):
	player.dmg_reduction += 1
	print("new dmg rred",player.dmg_reduction)
