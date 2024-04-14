extends Control

func _ready():
	pass

func _on_item_list_item_selected(index):
	if index == 0:
		print("dumbell")
	else:
		print("red potion")
	visible = false
