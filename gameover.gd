extends Node


func _ready() -> void:
	var money_lost = Global.get_money()
	$MoneyLostText.text = "[center]YoU jUst LoST $%s[/center]" % [Global.get_money()]
	Global.reset_on_gameover()
	


func _on_try_again_button_pressed() -> void:
	BgmPlayer.stop_music()
	get_tree().change_scene_to_file("res://round.tscn")
