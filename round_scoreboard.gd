extends Control


func _ready():
	var metrics = Global.round_metrics
	if metrics != null:
		$RichTextLabel.text = " bubble size: %s,   time taken %s" % [metrics.bubble_size, metrics.time_taken]




func _on_next_button_pressed() -> void:
	# get_tree().change_scene_to_file("res://upgrades.tscn")
	pass
	
