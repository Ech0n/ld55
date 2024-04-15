extends Node
class_name Item

var texture:CompressedTexture2D = load("res://assets/arrow.png")

var itemName : String = "unnamed"
var itemDescription : String = "no desription"

func collect(player):
	print("item collected (Parent class)")
