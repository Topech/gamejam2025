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



#class RandomGrowthManager:
	#var current_growth: float
	#
	#func _init():
		#self.current_growth = 0
	#
#
	#func random_growth() -> float:
		#current_growth += 0.4 * randf()
		#return min(1, current_growth)
