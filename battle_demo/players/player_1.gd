extends Node2D

var curr_posn
var attacking = false
var hit = false
var down = false 
var menu_open = false
var available_attacks = ["Slash", "Double Slash", "Flame Slash"]

var status = []
var invincible_counter = 0
var stun_counter = 0
var last_stand_invin

var curr_hp
var max_hp
var visible_hp

var defe

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CombinedSprite/CharPiece.play("default")
	$CombinedSprite/WeaponPiece.play("default")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func initialize_player():
	pass

func move_player():
	pass

func open_menu():
	pass

func apply_attack(attack_data):
	pass
