extends Node


## How much the bubble grows per second. Max is 100
@export var bubble_growth_rate: float = 20
@export var max_growth: float = 100

@onready var bubble_node: Node2D = $Bubble
@onready var is_growing: bool = false
@onready var initial_bubble_scale = Vector2(0, 0)
@onready var max_bubble_scale: float = 8

@onready var growth_time_elapsed: float = 0
@onready var all_growth: float = 0


signal popped
signal stopped




# round
	# - inputs (player upgrades - bubble-blower options, modifier for when to pop)
	# metrics
		# - how fast bubble grew
		# - how big bubble is
	# bubble-blower
		# - player upgrades
		# calc next growth
			# - linear
			# - exponential
			# - random
			# [stretch goal] - 'blowing' sine-wave
	# bubble
		# - scales sprite to growth
		# - translate to make look like growth from machine at bottom
	# UI
		# Blow btn
		# Stop btn
		# Progress bar
		
	# [stretch goals]
	# background upgrades
		# spawn extra bubbles to pop
	
	
# score screen
	# - inputs (metrics from round)
	# calc-money




func _ready() -> void:
	bubble_node.set_scale(initial_bubble_scale)
	
	$Bubble.max_growth = max_growth
	
	$StopButton.disabled = true
	$Bubble/BubblePopSprite.stop()
	$Bubble/BubblePopSprite.frame = 0
	

	


func _process(delta: float) -> void:
	
	if is_growing:
		growth_time_elapsed += delta

		var growth = bubble_growth_rate * delta
		all_growth += growth
		
		$Bubble.grow(all_growth)
		
		#var scale_inc = calc_scale_for_growth(growth)
		#var new_scale = min(max_bubble_scale, bubble_node.scale.x + scale_inc)
		#var new_scale_vec = Vector2(new_scale, new_scale)
#
		#bubble_node.set_scale(new_scale_vec)
		
		if all_growth >= max_growth:
			pop()
	
	$BubbleGrowthProgressBar.value = all_growth



func pop():
	$Bubble/BubblePopSprite.play_pop()
	is_growing = false
	emit_signal("popped")





func _on_blow_button_pressed() -> void:
	is_growing = true
	$BlowButton.disabled = true
	$StopButton.disabled = false



func _on_stop_button_pressed() -> void:
	is_growing = false
	$StopButton.disabled = true
	var metrics = MetricStruct.new(growth_time_elapsed, all_growth)
	emit_signal("stopped", metrics)
	

#
#
#func calc_scale_for_growth(growth: float) -> float:
	#""" growth is 0-100, scale is dependant """
	#var growth_ratio = growth / 100
	#return (growth_ratio * max_bubble_scale)
