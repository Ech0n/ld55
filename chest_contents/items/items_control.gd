extends Control
class_name ItemsControl

@onready
var player = get_tree().get_nodes_in_group("player")[0]


var it1 : Item
var it2 : Item

func setup(item1:Item,item2:Item):
	it1 = item1
	it2 = item2
	var itList = $ItemList
	
	itList.add_item(it1.itemName,it1.texture)
	itList.add_item(it2.itemName,it2.texture)
	
	

func _on_item_list_item_selected(index):
	if index == 0: #armor
		it1.collect(player)
	else: #blue
		it2.collect(player)
	visible = false
