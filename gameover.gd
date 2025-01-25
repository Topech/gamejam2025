extends Node



func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://round.tscn")
