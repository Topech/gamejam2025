extends Node

@export var player_money: int = 0  # Initialize with starting amount
@export var round_metrics: MetricStruct = null



func add_money(amount: int) -> void:
	player_money += amount



func spend_money(amount: int) -> bool:
	if player_money >= amount:
		player_money -= amount
		return true
	return false



func get_money() -> int:
	return player_money
