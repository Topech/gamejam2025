extends Node


@export var time_to_pop: float
@export var bubble_growth_rate = 0.5

var is_growing: bool
var bubble_node: Node2D

func _ready() -> void:
	is_growing = true
	bubble_node = $Bubble


func _process(delta: float) -> void:
	if is_growing:		
		bubble_node.scale += (Vector2(bubble_growth_rate, bubble_growth_rate))
