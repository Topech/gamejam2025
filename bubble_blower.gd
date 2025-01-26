extends Node
## Provides functions for different growth models

## Seconds until end of growth
@export var max_seconds: float = 5



func linear_growth(seconds: float) -> float:
	var growth = (seconds / max_seconds)
	return min(1, growth)



func expo_growth(seconds: float) -> float:
	var _expo_aggressivity = 2
	var expo = _expo_aggressivity * (seconds - max_seconds) 
	var growth = pow(2, expo)
	return min(1, growth)



func hybrid_linear_expo_growth(seconds: float) -> float:
	var linear = 0.3 * linear_growth(seconds)
	var expo = expo_growth(seconds)
	return linear if linear > expo else expo



class RandomGrowthManager:
	var current_growth: float
	var variation_limit: float
	var variation: float
	var next_variation_time_limit: float
	var last_time_elapsed: float
	
	func _init(_variation_limit: float):
		current_growth = 0
		last_time_elapsed = 0
		variation_limit = _variation_limit
		reroll_variation()
	
	func reroll_variation():
		variation = variation_limit * randf()
		next_variation_time_limit = last_time_elapsed + min(1, (1 * randf()))


	func random_growth(time_elapsed: float) -> float:
		if time_elapsed >= next_variation_time_limit:
			reroll_variation()
		var delta = time_elapsed - last_time_elapsed
		current_growth += variation * delta
		last_time_elapsed = time_elapsed
		return min(1, current_growth)
		
		
func get_random_grower(variation: float):
	"""mildly cursed"""
	var random_manager = RandomGrowthManager.new(variation)
	return random_manager
	


func hybrid_linear_expo_growth_switchover(seconds: float, force_switchover: float) -> float:
	""" Force switchover is 0-1, ratio of max_seconds to switchover"""
	var linear = 0.5 * linear_growth(seconds)
	var expo = expo_growth(seconds)
	var time_to_switchover = max_seconds * force_switchover
	if seconds < time_to_switchover or linear > expo:
		return linear
	return expo

		

func randomised_hybrid_grow_fn_factory() -> Callable:
	var switchover = clamp(randf(), 0.1, 0.8)
	var partial_growth_fn = func(seconds: float) -> float:
		return hybrid_linear_expo_growth_switchover(seconds, switchover)
	return partial_growth_fn
	
	
