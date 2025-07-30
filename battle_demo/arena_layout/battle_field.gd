extends CenterContainer

func get_panel_posn(player_num, tile_num):
	var node_str = "HBox/P" + str(player_num) + "Spaces/BattleSpace" + str(tile_num)
	var target_node = get_node(node_str)
	return [target_node.global_position.x + int(target_node.size.x / 2), target_node.global_position.y]

func move_player_to_posn(past_tile, new_tile, player_num):
	var node_str1 = "HBox/P" + str(player_num) + "Spaces/BattleSpace" + str(past_tile)
	var old_node = get_node(node_str1)
	var node_str2 = "HBox/P" + str(player_num) + "Spaces/BattleSpace" + str(new_tile)
	var new_node = get_node(node_str2)
	old_node.player_moved_off()
	new_node.player_moved_on()

func apply_attack(target_tile):
	pass

func apply_status(target_tile):
	pass
	
func tile_available(player_num, tile_num):
	var node_str = "HBox/P" + str(player_num) + "Spaces/BattleSpace" + str(tile_num)
	var target_node = get_node(node_str)
	return target_node.can_move_to

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
