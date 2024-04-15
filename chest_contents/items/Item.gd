extends Node
class_name Item

var texture:CompressedTexture2D = load("res://assets/arrow.png")

var itemName : String = "unnamed"

func collect(player):
	print("item collected (Parent class)")
