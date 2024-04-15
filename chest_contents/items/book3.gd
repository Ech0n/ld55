class_name Book3
extends Item

var angel = load("res://summons/summon.tscn").instantiate()


func _init():
	itemName = "\"Summoning for dummies\""
	texture = load("res://assets/aseprite/Items/book1.png")
	itemDescription = "Summons new friend\n (he is not very strong)"
func collect(player):
	player.add_summon(angel)
