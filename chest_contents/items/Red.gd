class_name Red
extends Item

func _init():
	itemName = "Red Potion"
	texture = load("res://assets/aseprite/Items/red_pot.png")

func collect(player):
	player.curr_health += 50
