extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.spend_money(100):
		pass
	pass

func _on_pressed() -> void:
	
	if Global.spend_money(int(float(100) * pow(1.2, Global.soap_level))): # Checks if the player can afford the 1.1^level * 100
		Global.add_soap()
