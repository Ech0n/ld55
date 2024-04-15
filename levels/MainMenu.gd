extends Node2D

signal game_started

@onready
var animator = $animation/AnimationPlayer
@onready
var army = $animation/Army
@onready
var skelly = $animation/skelly

var areSkellysWalking = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !areSkellysWalking:
		if skelly.position.x > 446:
			makeSkeletonsWalk()

func makeSkeletonsWalk():
	areSkellysWalking = true
	print("making skelllys go")
	for c in army.get_children():
		if c.has_method("play"):
			c.play("walk")


func _on_play_button_pressed():
	animator.play("startGame")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "startGame":
		game_started.emit()
