extends Control

func _ready():
	pass

func _on_item_list_item_selected(index):
	if index == 0:
		print("book1")
	else:
		print("red potion")
	visible = false
