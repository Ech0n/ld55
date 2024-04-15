extends Node2D

const respawnDelay = 3
var time = 0
var timerStarted = false

func startTimer():
	time = 0

func _ready():
	time = 0

func _process(delta):
	time += delta
	$Control/Label2.text = "respawning in " + String.num(max(0,respawnDelay-time),1) + " seconds..."
	if(respawnDelay <= time):
		get_tree().paused = false
		queue_free()
