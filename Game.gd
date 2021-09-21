extends Spatial


onready var label : Label = $CanvasLayer/Label
onready var player : KinematicBody = $PlayerQ3


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
	label.text = "H Velocity: %3.2f" % [Vector2(player.velocity.x, player.velocity.z).length()]
	label.text += "\nV Velocity: %3.2f" % [player.velocity.y]
	label.text += "\nOn floor: %s" % player.is_on_floor()


func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_F:
			OS.window_fullscreen = !OS.window_fullscreen
		elif event.scancode == KEY_ESCAPE:
			get_tree().quit()
