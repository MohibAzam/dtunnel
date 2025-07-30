extends HBoxContainer

# TODO: Spawn in a letter for each part of the message desired and arrange them via HBox
# TODO: Add separation to the letters such that they're as far apart as possible
# TODO: Quickly shrink the separation to 0 (do so such that the shrink time is the same regardless of monitor sizing / text length)
# TODO: A Shine effect (done via shader, starting from center and expanding out)
# should be done as the letters merge in 


const SHRINK_TIME = 20

var message_string = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_message(message): message_string = message

func set_critical():
	pass

func set_absorb():
	pass

func setup_shrink():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
