class_name Book3
extends Item

var angel = load("res://summons/AngelSummon.tscn").instantiate()


func _init():
	itemName = "Holly Book"
	texture = load("res://assets/aseprite/Items/book3.png")
	itemDescription = "Summon new friend"
func collect(player):
	player.add_summon(angel)
