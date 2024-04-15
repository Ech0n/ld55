extends Area2D
signal _on_portal_used

@onready
var popup = $popup

var portalActive = false

func _ready():
	popup.visible = false

func _process(_delta):
	if portalActive:
		if Input.is_action_just_pressed("use"):
			_on_portal_used.emit()

func _on_area_entered(area):
	if area.is_in_group("portal"):
		popup.visible = true
		portalActive = true
	

func _on_area_exited(area):
	popup.visible = false
	portalActive = false
