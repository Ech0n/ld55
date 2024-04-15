class_name Book1
extends Item

var golem = load("res://summons/summon.tscn").instantiate()


func _init():
	itemName = "Golem Book"
	texture = load("res://assets/aseprite/Items/book1.png")
	itemDescription = "Summon new friend"
	
func collect(player):
	player.add_summon(golem)
