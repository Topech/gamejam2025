extends Node


func _ready() -> void:
	$MoneyLostText.text = "YoU jUst LoST $%s" % [Global.get_money()]


func _on_try_again_button_pressed() -> void:
	BgmPlayer.stop_music()
	get_tree().change_scene_to_file("res://round.tscn")
