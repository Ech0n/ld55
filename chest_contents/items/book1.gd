class_name Book3
extends Item

var angel = load("res://summons/summon.tscn").instantiate()


func _init():
	itemName = "Book 1"
	texture = load("res://assets/aseprite/Items/book3.png")
	itemDescription = "Summon new friend"
	
func collect(player):
	player.add_summon(angel)
