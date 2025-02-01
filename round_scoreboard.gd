extends Control


func _ready():
	BgmPlayer.pause_music()
	Global.play_victory_sound()
	var metrics = Global.round_metrics
	var money_earned = calc_money(metrics)
	Global.add_money(money_earned)

	var bubble_metrics = [snapped(metrics.bubble_size, 0.1), snapped(metrics.time_taken, 0.01)]
	var water_info = [Global.chosen_water, get_water_type_multiplier()]
	var money_info = [money_earned, Global.get_money()]

	if metrics != null:
		$RichTextLabel.text = "bubble size: %s%%,   time taken %s sec" % bubble_metrics
		$RichTextLabel.text += "\n\nwater type: %s,   water type multiplier: %s" % water_info
		$RichTextLabel.text += "\n\nmoney earned $%s   total money $%s" % money_info



func calc_money(metrics):
	var money_earned: int = 0
	money_earned += metrics.time_taken * 100
	money_earned += metrics.bubble_size
	money_earned *= get_water_type_multiplier()
	return money_earned

func get_water_type_multiplier():
	const type_multipliers = {
		'swamp_water': 0.5,
		'mineral_water': 1,
		'holy_water': 2,
		'atomic_water': 5,
		'holy_water_real': 10,
	}
	return type_multipliers[Global.chosen_water]


func _on_next_button_pressed() -> void:
	BgmPlayer.unpause_music()
	BgmPlayer.play_song_wont_pop()
	get_tree().change_scene_to_file("res://upgrade_screen.tscn")
