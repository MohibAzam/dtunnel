extends Label

var bounce_on = false
var curr_velocity = 0
var bounce_count = 0
var posn_offset = 0
const ACCEL = -1
const BASE_VELOCITY = 10
const REDUCTION = 3
var original_posn = [0, 0]
const PAUSE_FRAMES = 5
var paused_time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_number(num: int): self.text = str(num)

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
	paused_time = 0
	bounce_on = true
	curr_velocity = BASE_VELOCITY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y = original_posn[1] - posn_offset
	if bounce_on:
		_update_velocities()
		paused_time += 1
		if paused_time == 5:
			show()
