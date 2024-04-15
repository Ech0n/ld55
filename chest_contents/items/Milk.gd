class_name Milk
extends Item

func _init():
	itemName = "Milk"
	texture = load("res://assets/aseprite/Items/milk.png")

func collect(player):
	player.max_health += 10
	player.curr_health += 10
	print(player.max_health, player.curr_health)
