extends Node

@onready var anim_player := $AnimationPlayer
@onready var track_1 := $Track1
@onready var track_2 := $Track2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Crossfades to new AudioStream
func crossfade(audio_stream: AudioStream) -> void:
	# If both already playing then it's being called in the middle of a fade and should be ignored.
	if track_1.playing and track_2.playing:
		return
	
	# If track1 is playing fade to track2, etc
	if track_2.playing:
		track_1.stream = audio_stream
		track_1.play()
		anim_player.play("FadeToTrack1")
	else:
		track_2.stream = audio_stream
		track_2.play()
		anim_player.play("FadeToTrack2")
