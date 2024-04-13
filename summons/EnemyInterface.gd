extends CharacterBody2D

var speed : float = 0.0 # Lower value =  Higher walkspeed
var player : Node2D = null
var in_attack_range : bool = false
var curr_health : float = 0.0
var attack_cooldown : float = 0
var curr_attack_cooldown : float = 0
var damage : float = 0

@onready
var animSprite = $AnimatedSprite2D

@onready
var infoLabel = $InfoLabel


func _ready():
	animSprite.play("walk")


func update_sprite_animation():
	animSprite.play("walk")
	if (player.position.x - position.x < 0):
		animSprite.flip_h = true
	if player.position.x - position.x > 0:
		animSprite.flip_h = false


func attack_player(): # This has to be overriden in order to work for ranged enemies
	if curr_attack_cooldown == 0:
		player.take_damage(damage)
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1


func _physics_process(delta):
	infoLabel.text = "Health: %d" % curr_health 
	infoLabel.position = Vector2(-50, -50)
	
	if player:
		if in_attack_range:
			attack_player()
			animSprite.play("attack")
			return
		
		position += (player.position - position) / speed
		update_sprite_animation()


func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body


func _on_detection_area_body_exited(body):
	if body.is_in_group("player"):
		player = null


func _on_attack_detection_area_body_entered(body):
	if body.is_in_group("player"):
		in_attack_range = true


func _on_attack_detection_area_body_exited(body):
	if body.is_in_group("player"):
		in_attack_range = false

func take_damage(damage : float):
	curr_health -= damage
	if curr_health <= 0:
		print(name + " DEATH")
		queue_free()

