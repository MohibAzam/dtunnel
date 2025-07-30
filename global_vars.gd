extends Node

const FRAME_RATE = 60

var curr_meter_effect_2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func calc_damage(base_power, atk, atk_mul, enemy_def, enemy_def_mul, status, elem, enemy_elem_dict, user_level):
	var multiplier = (user_level + (atk * atk_mul))
	var base_damage = base_power * multiplier * multiplier / (enemy_def * enemy_def_mul)
	
func calc_damage_heal(base_power, psy, psy_mul, status, user_level):
	return -(base_power * (user_level + (psy * psy_mul)) * status)
