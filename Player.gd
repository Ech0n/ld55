extends CharacterBody2D

@onready
var animSprite = $AnimatedSprite2D

@onready
var swordArea = $AnimatedSprite2D/swordArea

@onready
var playerColider = $colider

const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	if(attack):
		animSprite.play("attack")
		var bodies = swordArea.get_overlapping_bodies()
		for b in bodies:
			if b.name == "dummy":
				b.takeDamage(25)

	move_and_slide()


func _on_animation_finished():
	animSprite.play("idle")
