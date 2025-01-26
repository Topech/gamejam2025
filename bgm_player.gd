extends Node

@onready var anim_player := $AnimationPlayer
@onready var track_1 := $Track1
@onready var track_2 := $Track2
@onready var song_wont_pop := load("res://Assets/Music/GGJ2025Bubble-Won'tPop.ogg")
@onready var song_dont_pop := load("res://Assets/Music/GGJ2025Bubble-Don'tPop.ogg")
@onready var song_game_over := load("res://Assets/Music/GGJ2025Bubble-GAMEOVER.ogg")

var playback_position
var track_2_playing : bool # false = track1, true = track2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Crossfades to new AudioStream
func crossfade(audio_stream: AudioStream) -> void:
	# If both already playing then it's being called in the middle of a fade and should be ignored.
	#if track_1.playing and track_2.playing:
	#	return
	
	# If track1 is playing fade to track2, etc
	# Somehow the track names ended up backwards, but they work like this.
	if track_2.playing:
		track_1.playing = false
		track_1.stream = audio_stream
		track_1.play(track_2.get_playback_position())
		anim_player.play("FadeToTrack2")
	else:
		track_2.playing = false
		track_2.stream = audio_stream
		track_2.play(track_1.get_playback_position())
		anim_player.play("FadeToTrack1")

func play_song_wont_pop() -> void:
	crossfade(song_wont_pop)

func play_song_dont_pop() -> void:
	crossfade(song_dont_pop)

func play_song_game_over() -> void:
	stop_music()
	crossfade(song_game_over)

func stop_music() -> void:
	track_1.playing = false
	track_2.playing = false

func pause_music() -> void:
	if track_1.playing:
		playback_position = track_1.get_playback_position()
		track_2_playing = false
	elif track_2.playing:
		playback_position = track_2.get_playback_position()
		track_2_playing = true
	else:
		playback_position = 0.0
	track_1.stop()
	track_2.stop()

func unpause_music() -> void:
	if track_2_playing:
		track_2.play(playback_position)
	else:
		track_1.play(playback_position)
	

func _on_track_1_finished() -> void:
	track_1.play()


func _on_track_2_finished() -> void:
	track_2.play()
