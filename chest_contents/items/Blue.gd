class_name Blue
extends Item

func _init():
	itemName = "Blue Potion"
	texture = load("res://assets/aseprite/Items/blue_pot.png")
	itemDescription = "Makes your swings faster"
	
func collect(player):

	player.attack_cooldown -= 5
	print("new cooldown",player.attack_cooldown)
