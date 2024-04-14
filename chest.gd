extends StaticBody2D

var isPaused = false
var allItems = ["armor", "book1", "book2", "book3", "dumbell", "milk", "speed", "blue_pot", "red_pot"]

#Combinations of all items
var itemControlMap = {
	"armor,blue_pot": "Control",
	"blue_pot,armor": "Control",
	"armor,book1": "Control2",
	"book1,armor": "Control2",
	"armor,book2": "Control3",
	"book2,armor": "Control3",
	"armor,book3": "Control4",
	"book3,armor": "Control4",
	"armor,dumbell": "Control5",
	"dumbell,armor": "Control5",
	"armor,milk": "Control6",
	"milk,armor": "Control6",
	"red_pot,armor": "Control7",
	"armor,red_pot": "Control7",
	"armor,speed": "Control8",
	"speed,armor": "Control8",
	
	"blue_pot,book1": "Control9",
	"book1,blue_pot": "Control9",
	"blue_pot,book2": "Control10",
	"book2,blue_pot": "Control10",
	"blue_pot,book3": "Control11",
	"book3,blue_pot": "Control11",
	"blue_pot,dumbell": "Control12",
	"dumbell,blue_pot": "Control12",
	"blue_pot,milk": "Control13",
	"milk,blue_pot": "Control13",
	"blue_pot,red_pot": "Control14",
	"red_pot,blue_pot": "Control14",
	"blue_pot,speed": "Control15",
	"speed,blue_pot": "Control15",
	
	"book1,book2": "Control16",
	"book2,book1": "Control16",
	"book1,book3": "Control17",
	"book3,book1": "Control17",
	"book1,dumbell": "Control18",
	"dumbell,book1": "Control18",
	"book1,milk": "Control19",
	"milk,book1": "Control19",
	"book1,red_pot": "Control20",
	"red_pot,book1": "Control20",
	"book1,speed": "Control21",
	"speed,book1": "Control21",
	
	"book2,book3": "Control22",
	"book3,book2": "Control22",
	"book2,dumbell": "Control23",
	"dumbell,book2": "Control23",
	"book2,milk": "Control24",
	"milk,book2": "Control24",
	"book2,red_pot": "Control25",
	"red_pot,book2": "Control25",
	"book2,speed": "Control26",
	"speed,book2": "Control26",
	
	"book3,dumbell": "Control27",
	"dumbell,book3": "Control27",
	"book3,milk": "Control28",
	"milk,book3": "Control28",
	"book3,red_pot": "Control29",
	"red_pot,book3": "Control29",
	"book3,speed": "Control30",
	"speed,book3": "Control30",
	
	"dumbell,milk": "Control31",
	"milk,dumbell": "Control31",
	"dumbell,red_pot": "Control32",
	"red_pot,dumbell": "Control32",
	"dumbell,speed": "Control33",
	"speed,dumbell": "Control33",
	
	"milk,red_pot": "Control34",
	"red_pot,milk": "Control34",
	"milk,speed": "Control35",
	"speed,milk": "Control35",
	
	"speed,red_pot": "Control36",
	"red_pot,speed": "Control36"
}

func _ready():
	pass

func random_items():
	print("\nChest detected")
	
	# This is how you create and add summons
	var eye_summon := EyeSummon.new_summon(1) # 1 is index, there will be only 3 slots for summons
	get_tree().get_root().add_child(eye_summon)
	
	var item1 = allItems.pick_random()
	var item2 = allItems.pick_random()
	while item1 == item2:
		item2 = allItems.pick_random()

	var combinedItems = item1 + "," + item2
	var controlToShow = itemControlMap.get(combinedItems, "DefaultControl")

	display_control(controlToShow)
	
	# Remove the chest
	var chest = get_node("Chest")
	var hitbox = get_node("CollisionShape2D")
	if chest and hitbox:
		chest.queue_free()
		hitbox.queue_free()

	# pause_game()


func pause_game():
	isPaused = true
	get_tree().paused = true

func resume_game():
	isPaused = false
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		resume_game()

func display_control(controlName):
	var controlNode = get_node(controlName)
	controlNode.visible = true
