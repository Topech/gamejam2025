extends Button

var speed = 0.25
var n = 0
var x = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if (n >= 0 && n < (1 * x)):
		position += Vector2.RIGHT * speed
		n += 1
	elif (n >= (1 * x) && n < (2 * x)):
		position += Vector2.DOWN * speed
		n += 1
	elif (n >= (2 * x) && n < (3 * x)):
		position += Vector2.LEFT * speed
		n += 1
	elif (n >= (3 * x) && n < (4 * x)):
		position += Vector2.UP * speed
		n += 1
	elif n >= 4 * x:
		n = 0
			
