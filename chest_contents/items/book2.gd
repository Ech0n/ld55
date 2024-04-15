class_name Book2
extends Item

func _init():
	itemName = "Occult Book"
	texture = load("res://assets/aseprite/Items/book2.png")
	itemDescription = "Summon new friend"
func collect(player):
	player.dmg_reduction += 1
	print("book2")
