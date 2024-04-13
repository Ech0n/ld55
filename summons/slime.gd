extends CharacterBody2D

var speed = 20.0
var player = null
var in_attack_range = false
var curr_health = 50
var attack_cooldown = 0

@onready
var animSprite = $AnimatedSprite2D

func _ready():
	animSprite.play("walk")


func update_sprite_animation():
	animSprite.play("walk")
	if (player.position.x - position.x < 0):
		animSprite.flip_h = true
	if player.position.x - position.x > 0:
		animSprite.flip_h = false


func attack_player():
	if attack_cooldown == 0:
		player.curr_health -= 10
		attack_cooldown = 50 
	else:
		attack_cooldown -= 1


func _physics_process(delta):
	if player:
		if in_attack_range:
			animSprite.play("attack")
			attack_player()
			return
		position += (player.position - position) / speed
		update_sprite_animation()


func _on_detection_area_body_entered(body):
	if body.name == "Player":
		player = body


func _on_detection_area_body_exited(body):
	if body.name == "Player":
		player = null


func _on_attack_detection_area_body_entered(body):
	if body.name == "Player":
		in_attack_range = true


func _on_attack_detection_area_body_exited(body):
	if body.name == "Player":
		in_attack_range = false
