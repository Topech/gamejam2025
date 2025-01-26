extends Control

var muted : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menu/StartButton/StartButtonTooltip.visible = false
	BgmPlayer.play_song_wont_pop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://round.tscn")
	Global.play_button_sound()

func _on_options_button_pressed() -> void:
	Global.play_button_sound()
  pass

func _on_start_button_mouse_entered() -> void:
	$Menu/StartButton/StartButtonTooltip.visible = true


func _on_start_button_mouse_exited() -> void:
	$Menu/StartButton/StartButtonTooltip.visible = false


func _on_audio_toggle_pressed() -> void:
	Global.play_button_sound()
	muted = !muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), muted)
