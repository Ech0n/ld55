class_name Book2
extends Item

func _init():
	itemName = "Book"
	texture = load("res://assets/aseprite/Items/book1.png")

func collect(player):
	player.dmg_reduction += 1
	print("book1")
