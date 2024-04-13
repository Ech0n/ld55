extends CharacterBody2D

var speed = 25.0
var player = null
var in_attack_range = false
var curr_health = 50

@onready
var animSprite = $AnimatedSprite2D

func _ready():
	animSprite.play("walk")


func update_sprite_animation():
	if in_attack_range:
		animSprite.play("attack")
		return
		
	animSprite.play("walk")
	if (player.position.x - position.x < 0):
		animSprite.flip_h = true
	if player.position.x - position.x > 0:
		animSprite.flip_h = false


func _physics_process(delta):
	if player:
		position += (player.position - position) / speed
		update_sprite_animation()


func _on_detection_area_body_entered(body):
	player = body


func _on_detection_area_body_exited(body):
	player = null


func _on_attack_detection_area_body_entered(body):
	in_attack_range = true


func _on_attack_detection_area_body_exited(body):
	in_attack_range = false
