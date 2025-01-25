extends Button

var speed = 0.025
var n = 0
var dist_threshold = 25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if (n >= 0 && n < (1 * dist_threshold)):
		position += Vector2.RIGHT * speed
		n += 1
	elif (n >= (1 * dist_threshold) && n < (2 * dist_threshold)):
		position += Vector2.DOWN * speed
		n += 1
	elif (n >= (2 * dist_threshold) && n < (3 * dist_threshold)):
		position += Vector2.LEFT * speed
		n += 1
	elif (n >= (3 * dist_threshold) && n < (4 * dist_threshold)):
		position += Vector2.UP * speed
		n += 1
	elif n >= 4 * dist_threshold:
		n = 0
			
