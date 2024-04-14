extends Control

func _ready():
	pass

func _on_item_list_item_selected(index):
	if index == 0:
		print("milk")
	else:
		print("shoes")
	visible = false
