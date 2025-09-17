extends Node2D

var curr_posn
var is_attacking = false
var hit = false
var down = false 
var menu_open = false
var available_attacks = ["Flame", "Bolt", "Freeze"]

var status = []
var invincible_counter = 0
var stun_counter = 0
var last_stand_invin

var curr_hp
var max_hp
var visible_hp

signal attack_done

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CombinedSprite/CharPiece.play("default")
	$CombinedSprite/WeaponPiece.play("default")
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

func use_attack(attack_data=null):
	"""
	Call this function when we want to use an attack...
	"""
	$CombinedSprite/CharPiece.play("attack")
	$CombinedSprite/WeaponPiece.play("attack")
	is_attacking = true 

func _on_char_piece_animation_finished() -> void:
	is_attacking = false
	attack_done.emit()
	
func _on_attack_done() -> void:
	$CombinedSprite/CharPiece.play("default")
	$CombinedSprite/WeaponPiece.play("default")
	pass # Replace with function body.
