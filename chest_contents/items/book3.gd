class_name Book1
extends Item

func _init():
	itemName = "Book"
	texture = load("res://assets/aseprite/Items/book1.png")
	itemDescription = "Summon new friend"
func collect(player):
	player.dmg_reduction += 1
	print("book1")
