extends Node2D

# TODO: Use 0 indices for the player and panel numbers!
# TODO (9/8):
	# - Add the meter system
	# - Add attack selection menus
	# - Print debug messages based on the attack being emitted
	# - Use signals to pause the game until attack finishes applying...use animation timings?
# Down should be a standard attack (costs 1 meter), up is a customizable guard move, 
	# - On hit, you gain 1 meter and your meter rate increases!
		# - Have arrows next to your meter to indicate how fast it's increasing...
	# - The standard attack has a short startup. Other attacks cost way more meter (and rely on meter not being in cooldown)
# Shoulder buttons / Space and Right Ctrl opens up the attack menu
# - Use L2/R2 to switch between attack targets? Or we can default to nearest/currently attacking enemy
	# - OR let the player switch attack targets by mashing during animation
# - Basically, enemy position doesn't matter for determining where you're attacking (attacks shouldn't miss...)
	# - 
# - Ideally shouldn't be too many enemies on screen at once (ideally 2-3, maybe 5 at most)
# - How about a default attack that costs two meter(maybe one is ok?), has terrible cooldown, only hits enemies DIRECTLY in front, but comes out Frame 1
# Basic demo would have 4 or 5 modes:
	# - Tutorial
	# - Basic battle
	# - Normal battle (or maybe a gauntlet or basic adventure section?)
	# - *Extremely* intense battle (give a warning before the battle begins...)
	# - Customization screen
# - Maybe we should have some grids (or at least columns) in this distance to help guide on how attacks will move towards the player from the background?
	# - How about having the columns subtly appear when a relevant attack gets triggered? 
	# - Let's have a projectile attack that swishes around on which column it's gonna try to hit? Trick the player with the highlights?
	# - How about a fast forward column attack that switches direction *only* if you switch columns (but if you switch back to original col, which you should have time for, you'll dodge!)
# - For attack selection...It should be a 8-spot rotation (bottom spot is to skip turn) where you hold a direction and press the button to select your attack
	# - Test both traditional menus, pausing the game while menu is open, and keeping the combat going while menu is open! 
		# - What player actions should be allowed while menu is open, assuming game stays active? Maybe it's just Active vs Wait battle choice like CT 	
# - Music...let's use either PC Engine or FM Audio as default sounds. Or maybe PC Engine at first but switch to FM Audio for more intensive stuff.
# - Be sure to check your old notes!!! Especially for what happens on counter...
	# - Meter gain
	# - Meter goes up faster
	# - Some buffs to the player depending on equips?
	# - Counter deals extra damage? Perhaps based on how perfect the counter is...
var _players_hidden = true

# Current player positions
var player_tiles = [2, 2]

var _moving_player = false # s

var player_1_posn
var player_2_posn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HealthViewer2.adjust_name("Player 2")
	$Player1.hide()
	$Player2.hide()
	pass # Replace with function body.

func show_players():
	player_1_posn = $Battlefield.get_panel_posn(1, 2)
	player_2_posn = $Battlefield.get_panel_posn(2, 2)
	$Player1.global_position.x = player_1_posn[0]
	$Player1.global_position.y = player_1_posn[1] - 32
	$Player2.global_position.x = player_2_posn[0]
	$Player2.global_position.y = player_2_posn[1] - 32
	player_tiles = [2, 2]
	$Player1.show()
	$Player2.show()
	print($Player1.position)
	print($Player2.position)
	_players_hidden = false
	
func check_current_panel_status():
	pass	
	
func move_player(direction, player_num) -> bool:
	var proposed_posn = player_tiles[player_num - 1] + direction
	# Check if there is a tile for the player to move to
	if proposed_posn < 1 or proposed_posn > 3:
		return false
	
	# Check if that tile can currently be moved to
	if not $Battlefield.tile_available(player_num, proposed_posn):
		return false
		
	# Disable movement if player is attacking
	var player_node = get_node("Player" + str(player_num))
	if player_node.is_attacking:
		return false
	
	# If it's possible, move the player off the current tile...
	# First get the status / attack on the current tile to see 
	# if there's anything special we need to do...
	# TODO
	
	# Next, let the original tile know we're exiting
	# ...and then move the player onto the next tile!	
	$Battlefield.move_player_to_posn(player_tiles[player_num - 1], proposed_posn, player_num)
	player_tiles[player_num - 1] = proposed_posn
	player_node.curr_posn = proposed_posn
	print(proposed_posn)
	var new_player_posn = $Battlefield.get_panel_posn(player_num, proposed_posn)
	player_node.global_position.x = new_player_posn[0]
	player_node.global_position.y = new_player_posn[1] - 32
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _players_hidden:
		show_players()
		print("shown!")
	if Input.is_action_just_pressed("Player1Left"):
		move_player(-1, 1)
	elif Input.is_action_just_pressed("Player1Right"):
		move_player(1, 1)
	elif Input.is_action_just_pressed("Player1Attack"):
		$Player1.use_attack()
	if Input.is_action_just_pressed("Player2Left"):
		move_player(-1, 2)
	elif Input.is_action_just_pressed("Player2Right"):
		move_player(1, 2)
	elif Input.is_action_just_pressed("Player2Attack"):
		$Player2.use_attack()

func apply_attack(attack_source, attack_data, target_tile):
	pass
