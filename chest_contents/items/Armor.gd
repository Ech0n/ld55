class_name Armor
extends Item

func _init():
	itemName = "Armor"
	texture = load("res://assets/aseprite/Items/armor.png")
	itemDescription = "Some armor to protect you from enemies"

func collect(player):
	player.dmg_reduction += 1
	print("new dmg rred",player.dmg_reduction)
