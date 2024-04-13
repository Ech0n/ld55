extends CharacterBody2D

@onready
var animSprite = $AnimatedSprite2D

@onready
var swordArea = $AnimatedSprite2D/swordArea

@onready
var playerColider = $colider

@onready
var healthLabel = $HealthLabel

const SPEED = 300.0

var attack_cooldown = 30
var max_health = 100.0
var curr_health = 100.0
var curr_attack_cooldown = 0

func _ready():
	animSprite.play("idle")

func update_sprite_animation(xVelocity):
	if animSprite.animation == "attack":
		return
		
	animSprite.play("walk")	
	if xVelocity <0:
		animSprite.scale.x = -1
	if xVelocity >0:
		animSprite.scale.x = 1

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2( Input.get_axis("left", "right"), Input.get_axis("up","down"))
	
	velocity = direction.normalized() * SPEED
	
	if velocity and animSprite:
		update_sprite_animation(velocity.x)
	elif animSprite.animation != "attack":
		animSprite.play("idle")

	var attack = Input.is_action_just_released("attack")
	if attack and curr_attack_cooldown == 0:
		animSprite.play("attack")
		var bodies = swordArea.get_overlapping_bodies()
		for b in bodies:
			if b.is_in_group("enemy"):
				b.take_damage(25)
		curr_attack_cooldown = attack_cooldown
	
	if curr_attack_cooldown > 0:
		curr_attack_cooldown -= 1

	move_and_slide()
	update_health_label()

func update_health_label():
	healthLabel.text = "Health: %d" % curr_health
	healthLabel.position = Vector2(0, -50)


func _on_animation_finished():
	animSprite.play("idle")


func _on_pickup_area_body_entered(body):
	if body.has_method("random_items"):
		body.random_items()
	
func take_damage(damage):
	curr_health -= damage
	if curr_health < 0:
		pass # Death happens here
