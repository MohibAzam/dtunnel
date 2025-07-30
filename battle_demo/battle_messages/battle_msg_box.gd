extends PanelContainer

var curr_text = ""
var queued_text = ""
var text_count = 0
var text_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# set_typed_message("The/end/comes...beyond/chaos.", 1)
	set_typed_message("Found/1x/Potion\nFound/1x/Super/Potion")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text_count += roundi(delta * GlobalVars.FRAME_RATE)
	while text_count >= text_counter:
		if not (len(curr_text) == len(queued_text)):
			curr_text += queued_text[len(curr_text)]
			text_count -= text_counter
			$RenderedText.text = curr_text
		else:
			break

func set_typed_message(message, speed=-1):
	# If we're just typing out a message as part of the battle
	curr_text = ""
	queued_text = message
	text_count = 0
	text_counter = max(speed, 0)
	
func set_attack_message(message, ):
	pass
	
