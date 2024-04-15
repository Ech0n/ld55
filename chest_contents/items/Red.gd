class_name Red
extends Item

func _init():
	itemName = "Red Potion"
	texture = load("res://assets/aseprite/Items/health_pot.png")
	itemDescription = "Restore some of your health"

func collect(player):
	player.curr_health += 50
