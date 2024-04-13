extends StaticBody2D

var isPaused = false
var allItems = ["armor", "book1", "book2", "book3", "dumbell", "milk", "speed", "blue_pot", "red_pot"]
var item1
var item2 

func _ready():
	pass

func pickup():
	print("Chest detected")

func pause_game():
	isPaused = true
	get_tree().paused = true

func resume_game():
	isPaused = false
	get_tree().paused = false
	
func random_items():
	item1 = allItems.pick_random()
	item2 = allItems.pick_random()
	while item1 == item2:
		item2 = allItems.pick_random()
	print(item1 + " " + item2)
		
