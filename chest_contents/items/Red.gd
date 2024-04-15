class_name Red
extends Item

func _init():
	itemName = "Red Potion"
	texture = load("res://assets/aseprite/Items/health_pot.png")
	itemDescription = "Restore some of your health"

func collect(player):
	
	if player.curr_health + 50 > player.max_health:
		player.curr_health = player.max_health
	else:
		player.curr_health += 50
