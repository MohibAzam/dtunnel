extends Node2D

var curr_posn
var attacking = false
var hit = false
var down = false 
var menu_open = false
var available_attacks = ["Flame", "Bolt", "Freeze"]

var status
var invincible_counter = 0
var stun_counter = 0
var last_stand_invin

var curr_hp
var max_hp
var visible_hp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move_player():
	pass

func open_menu():
	pass

func handle_hit():
	pass
