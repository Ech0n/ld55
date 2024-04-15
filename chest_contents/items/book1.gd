class_name Book3
extends Item

func _init():
	itemName = "Book"
	texture = load("res://assets/aseprite/Items/book3.png")

func collect(player):
	player.dmg_reduction += 1
	print("book3")
