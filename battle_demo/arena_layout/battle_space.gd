extends Panel

var panel_num
var active_status = []
var can_move_to = true
var cant_move_to_timer = 0
const cant_move_to_time_limit = 600
var standing_on = false

# List of attacks being directed at this panel
# If there are multiple attacks, we use the first attack for damage
# and then use the 
var active_attacks = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_move_to == false: cant_move_to_timer += 1
	if cant_move_to_time_limit <= cant_move_to_timer: can_move_to = true

# Use this to update the tile when a player moves onto or off of it
func _update_tile_status():
	pass

func player_moved_on():
	pass
	
func player_moved_off():
	pass

func apply_attack():
	# Attack data:
	# - Name of the attack
	# - Effects of the attack
	# - Power of the attack
	# - Source of the attack
	# - Post-damage invincibility information
	# - Stun time
	# - Element
	# - Panel Effects
	# - Number of active frames
	
	# At each timestep, the function is going to output an array about each attack
	# being applied at each panel, as well as what impacts that will have on each panel
	
	pass

func apply_status():
	pass
