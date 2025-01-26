extends Node


@export var max_growth: float = 100

@onready var bubble_node: Node2D = $Bubble
@onready var is_growing: bool = false

@onready var growth_time_elapsed: float = 0
@onready var all_growth: float = 0
@onready var random_growth_manager = $BubbleBlower.get_random_grower(0.8)
@onready var random_hybrid_growth_fn: Callable = $BubbleBlower.randomised_hybrid_grow_fn_factory()


signal popped
signal stopped




func _ready() -> void:	
	$Bubble.max_growth = max_growth

	$StopButton.disabled = true
	$BlowButton.visible = true
	$StopButton.visible = false

	$Bubble/BubblePopSprite.stop()
	$Bubble/BubblePopSprite.frame = 0

	$BubbleGrowthProgressBar.max_value = max_growth

	$BubbleBlower.max_seconds = 5 + Global.soap_level
	BgmPlayer.play_song_dont_pop()


func _process(delta: float) -> void:
	
	if is_growing:
		growth_time_elapsed += delta

		var growth_percent: float
		match Global.chosen_water:
			"atomic":
				growth_percent = random_growth_manager.random_growth(growth_time_elapsed)
			"holy(real)":
				growth_percent = random_hybrid_growth_fn.call(growth_time_elapsed)
			"holy":
				growth_percent = $BubbleBlower.hybrid_linear_expo_growth(growth_time_elapsed)
			"mineral":
				growth_percent = $BubbleBlower.expo_growth(growth_time_elapsed)
			"swamp":
				growth_percent = $BubbleBlower.linear_growth(growth_time_elapsed)

			
		
		all_growth = growth_percent * max_growth
		$Bubble.grow(all_growth)

		if all_growth >= max_growth:
			pop()
	
	$BubbleGrowthProgressBar.value = all_growth



func pop():
	$StopButton.disabled = true
	$Bubble/BubblePopSprite.play_pop()
	is_growing = false
	emit_signal("popped")
	BgmPlayer.play_song_game_over()
	await get_tree().create_timer(0.6).timeout
	get_tree().change_scene_to_file("res://gameover.tscn")



func _on_blow_button_pressed() -> void:
	is_growing = true
	$BlowButton.disabled = true
	$StopButton.disabled = false
	$BlowButton.visible = false
	$StopButton.visible = true



func _on_stop_button_pressed() -> void:
	is_growing = false
	$StopButton.disabled = true
	var metrics = MetricStruct.new(growth_time_elapsed, all_growth)
	Global.round_metrics = metrics
	emit_signal("stopped", metrics)
	await get_tree().create_timer(1).timeout
	BgmPlayer.play_song_wont_pop()
	get_tree().change_scene_to_file("res://round_scoreboard.tscn")

	
