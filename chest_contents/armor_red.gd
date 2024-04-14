extends Control

@onready
var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	pass

func _on_item_list_item_selected(index):
	if index == 0: #armor
		player.dmg_reduction += 1
		print(player.dmg_reduction)
	else:
		player.curr_health += 50
		print(player.curr_health)
	visible = false
