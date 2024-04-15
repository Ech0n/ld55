class_name Book2
extends Item

var angel = load("res://summons/EyeSummon.tscn").instantiate()


func _init():
	itemName = "Occult Book"
	texture = load("res://assets/aseprite/Items/book2.png")
	itemDescription = "Summon new friend"
func collect(player):
	player.add_summon(angel)
