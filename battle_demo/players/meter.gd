extends HBoxContainer

const MAX_METER = 1000

var meter_count = 0
var MAX_METER_COUNT = 3
var bar_amount = 0
var increment_amount = 20

var full_frame_count = 0
var full_frame_step = 50
var meter_effect = 0 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# If the meter is not full, be sure to reset the full counter
	if meter_count < MAX_METER_COUNT:
		full_frame_count = 0

	increment_bar()
	update_viz_bar()
	update_meter_count()
	
	# If the meter is full, increment the full counter
	if meter_count == MAX_METER_COUNT:
		full_frame_count += 1
		if full_frame_count % full_frame_step == 0:
			pass

func update_viz_bar():
	pass

func update_meter_count():
	if bar_amount >= MAX_METER:
		meter_count += int(bar_amount / MAX_METER)
		bar_amount = bar_amount % MAX_METER
	elif bar_amount < 0:
		meter_count += int((bar_amount - 1800) / MAX_METER)
		bar_amount = bar_amount % MAX_METER

func increment_bar(inc=increment_amount): bar_amount += inc
func decrement_bar(dec=increment_amount): bar_amount -= dec
func set_increment_amount(new_amount): increment_amount = new_amount
func mult_increment_amount(multiplier): increment_amount *= multiplier 
