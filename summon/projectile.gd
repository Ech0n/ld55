extends Area2D


var speed = 750

var target
var targetDir

@onready
var timeSinceStart = 0

func _physics_process(delta):
	if targetDir:
		position += targetDir * speed * delta
	timeSinceStart+=delta
	if(timeSinceStart > 3):
		queue_free()




func _on_body_entered(body):
	if body.is_in_group("ops"):
		#body.queue_free()
		body.takeDamage(10)
	queue_free()

func set_target(targetDirection):
	targetDir = targetDirection
