extends Node2D

@export var max_growth: float = 100

@export var initial_bubble_scale: float = 0
@export var max_bubble_scale: float = 8



func calc_scale_for_growth(growth: float) -> float:
	""" growth is 0-`max_growth`, scale is dependant """
	var growth_ratio = growth / max_growth
	return growth_ratio * max_bubble_scale


func grow(growth: float):
	var new_scale = (min(max_bubble_scale, calc_scale_for_growth(growth)))
	var scale_vec = Vector2(new_scale, new_scale)
	set_scale(scale_vec)
	
	
