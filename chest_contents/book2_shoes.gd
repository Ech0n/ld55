extends Control

@onready
var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	pass

func _on_item_list_item_selected(index):
	if index == 0:
		print("book2")
	else:
		player.SPEED += 30
		print(player.SPEED)
	visible = false
