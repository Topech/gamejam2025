extends Node


## How much the bubble grows per second. Max is 100
@export var bubble_growth_rate: float = 20

@onready var bubble_node: Node2D = $Bubble
@onready var is_growing: bool = false
@onready var initial_bubble_scale = Vector2(0, 0)
@onready var max_bubble_scale: float = 500

@onready var growth_time_elapsed: float = 0
@onready var all_growth: float = 0


signal popped
signal stopped





func _ready() -> void:
	bubble_node.set_scale(initial_bubble_scale)
	
	$StopButton.disabled = true
	


func _process(delta: float) -> void:
	
	if is_growing:
		growth_time_elapsed += delta

		var growth = bubble_growth_rate * delta
		all_growth += growth
		
		var scale_inc = calc_scale_for_growth(growth)
		var new_scale = min(max_bubble_scale, bubble_node.scale.x + scale_inc)
		var new_scale_vec = Vector2(new_scale, new_scale)

		bubble_node.set_scale(new_scale_vec)
		
		if new_scale >= max_bubble_scale:
			emit_signal("popped")
			is_growing = false
	
	$BubbleGrowthProgressBar.value = all_growth



func _on_blow_button_pressed() -> void:
	is_growing = true
	$BlowButton.disabled = true	
	$StopButton.disabled = false



func _on_stop_button_pressed() -> void:
	is_growing = false
	$StopButton.disabled = true
	emit_signal("stopped")



func calc_scale_for_growth(growth: float) -> float:
	""" growth is 0-100, scale is dependant """
	var growth_ratio = growth / 100
	return (growth_ratio * max_bubble_scale)
