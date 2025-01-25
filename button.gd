extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menu/StartButton/StartButtonTooltip.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:



func _on_start_button_pressed() -> void:
	#get_tree().change_scene()
	pass



func _on_options_button_pressed() -> void:
	pass # Replace with function body.


func _on_start_button_mouse_entered() -> void:
	$Menu/StartButton/StartButtonTooltip.visible = true


func _on_start_button_mouse_exited() -> void:
	$Menu/StartButton/StartButtonTooltip.visible = false
