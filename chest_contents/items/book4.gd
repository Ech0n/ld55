class_name Book4
extends Item

var angel = load("res://summons/AngelSummon.tscn").instantiate()


func _init():
	itemName = "Holy book"
	texture = load("res://assets/aseprite/Items/book3.png")
	itemDescription = "Summons new friend"
func collect(player):
	player.add_summon(angel)
