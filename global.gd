extends Node

@export var player_money: int = 0  # Initialize with starting amount
@export var round_metrics: MetricStruct = null
@export var soap_level: int = 1 # Initialise at level 1
@export var unlocked_water: Array = ["swamp"] # Unlocked water array
@export var chosen_water: String = unlocked_water[0]

var button_player: AudioStreamPlayer
var victory_player: AudioStreamPlayer


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

func _ready() -> void:
	button_player = AudioStreamPlayer.new()
	add_child(button_player)
	button_player.stream = preload("res://bubble_tiny.wav")
	
	victory_player = AudioStreamPlayer.new()
	add_child(victory_player)
	victory_player.stream = preload("res://victory.ogg")
	
