extends StaticBody2D

var isPaused = false
var allItems = ["armor", "book1", "book2", "book3", "dumbell", "milk", "speed", "blue_pot", "red_pot"]
var itemPopups = {}

func _ready():
	for item in allItems:
		var popup = Popup.new()
		popup.add_child(Label.new())
		popup.get_child(0).text = item
		popup.hide()
		itemPopups[item] = popup
		add_child(popup)

func random_items():
	print("Chest detected")
	var item1 = allItems.pick_random()
	var item2 = allItems.pick_random()
	while item1 == item2:
		item2 = allItems.pick_random()
	print(item1 + " " + item2)
	itemPopups[item1].show()
	print("popup1")
	itemPopups[item2].show()
	print("popup2")
	#pause_game()

func pause_game():
	isPaused = true
	get_tree().paused = true

func resume_game():
	isPaused = false
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		resume_game()
	for item in itemPopups.keys():
		itemPopups[item].hide()
