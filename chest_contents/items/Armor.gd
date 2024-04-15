class_name Armor
extends Item

func _init():
	itemName = "Armor"
	texture = load("res://assets/aseprite/Items/armor.png")

func collect(player):
	player.attack_cooldown -= 5
	print("new cooldown",player.attack_cooldown)
