class_name Book3
extends Item

func _init():
	itemName = "Holly Book"
	texture = load("res://assets/aseprite/Items/book3.png")
	itemDescription = "Summon new friend"
func collect(player):
	player.dmg_reduction += 1
	print("book3")
