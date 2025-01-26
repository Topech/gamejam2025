extends Node2D

var max_points = 20  # Limit the number of trail points

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	$Line2D.add_point(mouse_pos)
	
	# Remove old points to limit the trail length
	if $Line2D.get_point_count() > max_points:
		$Line2D.remove_point(0)
