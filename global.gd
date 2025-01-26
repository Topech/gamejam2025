extends Node

@export var player_money: int = 0  # Initialize with starting amount
@export var round_metrics: MetricStruct = null
@export var soap_level: int = 1 # Initialise at level 1
@export var unlocked_water: Array = ["swamp_water"] # Unlocked water array
@export var chosen_water: String = unlocked_water[0]

var button_player: AudioStreamPlayer
var victory_player: AudioStreamPlayer
var pop_player: AudioStreamPlayer
var pump_player: AudioStreamPlayer

# for pump
var interval_timer = 0.7
var min_pitch = 0.7
var max_pitch = 1.3
var rng = RandomNumberGenerator.new()
var sxf_timer: Timer
var is_pump_playing: bool = false  


func add_money(amount: int) -> void:
	player_money += amount

func add_soap() -> void:
	soap_level += 1

func add_water(added_water: String) -> void:
	unlocked_water.append(added_water)

func reset_money() -> void:
	player_money = 0

func spend_money(amount: int) -> bool:
	if player_money >= amount:
		player_money -= amount
		return true
	return false

func get_money() -> int:
	return player_money

func get_soap() -> int:
	return soap_level

func play_button_sound():
	button_player.play()

func play_victory_sound():
	victory_player.play()

func play_pop_sound():
	pop_player.play()

func play_pump_sound():
	if is_pump_playing:
		pump_player.pitch_scale = randf_range(min_pitch, max_pitch)
		pump_player.play()

func start_pump():
	is_pump_playing = true
	play_pump_sound()
	sxf_timer.start()

func stop_pump():
	is_pump_playing = false
	sxf_timer.stop()

func _ready() -> void:
	button_player = AudioStreamPlayer.new()
	add_child(button_player)
	button_player.stream = preload("res://sfx_bubble_tiny.wav")
	
	victory_player = AudioStreamPlayer.new()
	add_child(victory_player)
	victory_player.stream = preload("res://sfx_victory.ogg")
	
	pop_player = AudioStreamPlayer.new()
	add_child(pop_player)
	pop_player.stream = preload("res://sfx_pop.wav")
	interval_timer = Timer.new()
	add_child(interval_timer)
	
	#sfx pump
	pump_player = AudioStreamPlayer.new()
	add_child(pump_player)
	pump_player.stream = preload("res://sfx_pump.wav")
	sxf_timer = Timer.new()
	add_child(sxf_timer)
	sxf_timer.wait_time = 0.5
	sxf_timer.one_shot = false
	sxf_timer.connect("timeout", play_pump_sound)

func get_unlocked_water() -> Array:
	return unlocked_water


func reset_on_gameover():
	reset_money()
	soap_level = 1
	unlocked_water = ['swamp_water']
