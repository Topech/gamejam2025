extends Control


func _ready():
	var metrics = Global.round_metrics
	var money_earned = calc_money(metrics)
	Global.add_money(money_earned)

	if metrics != null:
		$RichTextLabel.text = " bubble size: %s,   time taken %s   money %s" % [metrics.bubble_size, metrics.time_taken, money_earned]




func calc_money(metrics):
	var money_earned: int = 0
	money_earned += metrics.time_taken * 100
	money_earned += metrics.bubble_size
	return money_earned
	


func _on_next_button_pressed() -> void:
	get_tree().change_scene_to_file("res://upgrade_screen.tscn")
