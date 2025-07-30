extends HBoxContainer

var damage_val
const LOG_10 = log(10)

var digit_template = preload("res://battle_demo/damage_digit.tscn")

# Use this for handling the bouncing of the number.
var bounce_on = false
var curr_velocity = 0
var bounce_count = 0
var posn_offset = 0
const ACCEL = -1
const BASE_VELOCITY = 10
const REDUCTION = 3
var original_posn = [200, 200]
const PAUSE_FRAMES = 5
var paused_time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	render_damage(1000)
	pass # Replace with function body.

func set_original_posn(): 
	original_posn
	
# Use a green shader for healing
func set_heal():
	pass

# test
func set_weak():
	pass
	
func set_resist():
	pass

# test 


func _setup_damage():
	var num_digits = ceil(log(damage_val) / LOG_10) + 1
	var digits_list = range(num_digits)
	digits_list.reverse()
	var temp_damage = damage_val
	for i in digits_list:
		var new_digit_instance = digit_template.instantiate()
		var ten_pow = pow(10, i)
		var digit_val = floor(temp_damage / ten_pow)
		new_digit_instance.set_number(digit_val)
		temp_damage -= digit_val * ten_pow
		new_digit_instance.name = "Digit_" + str(i)
		add_child(new_digit_instance)

func _update_velocities():
	posn_offset += curr_velocity
	curr_velocity += ACCEL
	if posn_offset < 0: posn_offset = 0
	if posn_offset == 0 and not(curr_velocity == 0):
		bounce_count += 1
		curr_velocity = BASE_VELOCITY - REDUCTION * bounce_count
	if posn_offset == 0 and curr_velocity <= 0:
		curr_velocity = 0
		bounce_on = false

func render_damage(damage: int = self.damage_val):
	self.damage_val = damage
	paused_time = 0
	hide()
	_setup_damage()
	bounce_on = true
	curr_velocity = BASE_VELOCITY
	
	# The bounce should work like this...
	# Start at 100 velocity. Then 50. Then 25. Then 0.
	# Once you get to 0, stop moving the number.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y = original_posn[1] - posn_offset
	if bounce_on:
		_update_velocities()
		paused_time += 1
		if paused_time == 5:
			show()
