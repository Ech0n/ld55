extends Node2D

@export
var levels : PackedScene
@export
var intro: PackedScene

var introObject : Node2D
var gameObject: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func intro_finished():
	introObject.queue_free()
	get_tree().paused = false
	


func _on_game_started():
	introObject = intro.instantiate()
	introObject.connect("on_intro_finished",intro_finished)
	introObject.z_index = 5
	add_child(introObject)
	$MainMenu.queue_free()
	get_tree().paused = true
	gameObject = levels.instantiate()
	add_child(gameObject)
	
