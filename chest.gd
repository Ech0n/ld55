extends StaticBody2D

@onready
var itemControl = load("res://chest_contents/items/items_control.tscn")

var isPaused = false
var allItems = ["armor", "book1", "book2", "book3", "dumbell", "milk", "speed", "blue_pot", "red_pot"]


var items : Array[Item]=[
	Armor.new(),
	Blue.new(),
	Book1.new(),
	Book2.new(),
	Book3.new(),
	Milk.new(),
	Red.new(),
	Shoes.new(),
	Dumbell.new()
]

func _ready():
	pass
	
var controlInstance : Control

func random_items():
	print("\nChest detected")
	
	# This is how you create and add summons
	#var eye_summon := EyeSummon.new_summon(1) # 1 is index, there will be only 3 slots for summons
	#get_tree().get_root().add_child(eye_summon)
	
	var item1 = items.pick_random()
	var item2 = items.pick_random()
	while item1 == item2:
		item2 = items.pick_random()
		
	controlInstance = itemControl.instantiate()
	controlInstance.setup(item1,item2)
	#var combinedItems = item1 + "," + item2
	#var controlToShow = itemControlMap.get(combinedItems, "DefaultControl")

	add_child(controlInstance)
	controlInstance.visible = true
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

#func display_control(controlName):
	#var controlNode = get_node(controlName)
	#controlNode.visible = true
