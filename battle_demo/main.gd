extends Node2D

# TODO: Use 0 indices for the player and panel numbers!

var _players_hidden = true

# Current player positions
var player_tiles = [2, 2]

var _moving_player = false # s

var player_1_posn
var player_2_posn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player1.hide()
	$Player2.hide()
	pass # Replace with function body.

func show_players():
	player_1_posn = $Battlefield.get_panel_posn(1, 2)
	player_2_posn = $Battlefield.get_panel_posn(2, 2)
	$Player1.global_position.x = -player_1_posn[0]
	$Player1.global_position.y = 100 # player_1_posn[1] - 5  
	$Player2.global_position.x = player_1_posn[0]
	$Player2.global_position.y = 100 # player_2_posn[1] - 5  
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
	
	# If it's possible, move the player off the current tile...
	# First get the status / attack on the current tile to see 
	# if there's anything special we need to do...
	
	# Next, let the original tile know we're exiting
	# ...and then move the player onto the next tile!
	$Battlefield.move_player_to_posn(player_tiles[player_num - 1], proposed_posn, player_num)
	var player_node = get_node("Player" + str(player_num))
	player_node.curr_posn = proposed_posn
	$Player1.position.x = player_1_posn[0]
	$Player1.position.y = player_1_posn[1] - 5  
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
	if Input.is_action_just_pressed("Player2Left"):
		move_player(-1, 2)
	elif Input.is_action_just_pressed("Player2Right"):
		move_player(1, 2)

func apply_attack(attack_source, attack_data, target_tile):
	pass
