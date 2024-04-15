class_name Book1
extends Item

var angel = load("res://summons/AngelSummon.tscn").instantiate()


func _init():
	itemName = "Book 3"
	texture = load("res://assets/aseprite/Items/book3.png")
	itemDescription = "Summon new friend"
func collect(player):
	player.add_summon(angel)
