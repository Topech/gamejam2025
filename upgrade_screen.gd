extends Control
var selected_button = "soap"
var description_text = ""
var description_title = "Soap"
var upgrade_cost = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CurrentMoney.text = "Money: $" + str(Global.get_money())
	
	if Global.get_unlocked_water().has("mineral_water"):
		$UpgradeMineralWater.disabled = true
	if Global.get_unlocked_water().has("holy_water"):
		$UpgradeHolyWater.disabled = true
	if Global.get_unlocked_water().has("atomic_water"):
		$UpgradeAtomicWater.disabled = true
	if Global.get_unlocked_water().has("holy_water_real"):
		$UpgradeHolyWaterReal.disabled = true
	
	match selected_button:
		"soap":
			description_title = "Soap"
			description_text = "Makes your soap even soapier!"
			upgrade_cost = int(float(100) * pow(1.2, Global.soap_level))
		"mineral_water":
			description_title = "Mineral Water"
			description_text = "Mineral water from the finest underground natural springs and aquifers. With surface water becoming scarce, many bubble tycoons have turned to Mineral water instead."
			upgrade_cost = 500
		"holy_water":
			description_title = "Holy Water"
			description_text = "Large reserves of this Holy water used to be available during The Bubble War. Recent legislation has outlawed its use for making bubbles for all but the keenest tycoons!"
			upgrade_cost = 1000
		"atomic_water":
			description_title = "Atomic Water"
			description_text = "Bad for drinking. Great for making bubbles!"
			upgrade_cost = 2500
		"holy_water_real":
			description_title = "Holy Water (Real)"
			description_text = "Warning: creates highly unstable, but exquisitely profitable bubbles."
			upgrade_cost = 10000
	
	$RichTextLabel.text = "Upgrade " + description_title + "
-------------------------
Cost: $" + str(upgrade_cost) + "
-------------------------
Description:
" + description_text


# Following code is for determining which upgrade is selected
func _on_upgrade_soap_pressed() -> void:
	Global.play_button_sound()
	selected_button = "soap"

func _on_upgrade_mineral_water_pressed() -> void:
	Global.play_button_sound()
	selected_button = "mineral_water"

func _on_upgrade_holy_water_pressed() -> void:
	Global.play_button_sound()
	selected_button = "holy_water"

func _on_upgrade_atomic_water_pressed() -> void:
	Global.play_button_sound()
	selected_button = "atomic_water"

func _on_upgrade_holy_water_real_pressed() -> void:
	Global.play_button_sound()
	selected_button = "holy_water_real"

func _on_buy_upgrade_pressed() -> void:
	if Global.spend_money(upgrade_cost):
		match selected_button:
			"soap":
				Global.add_soap()
				Global.play_buy_sound()
			_:
				Global.add_water(selected_button)
				Global.play_buy_sound()
	else:
		Global.play_button_sound()
	
