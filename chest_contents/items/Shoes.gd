class_name Shoes
extends Item

func _init():
	itemName = "Shoes"
	texture = load("res://assets/aseprite/Items/speed.png")
	itemDescription = "Makes you faster"
	
func collect(player):
	player.SPEED += 30
