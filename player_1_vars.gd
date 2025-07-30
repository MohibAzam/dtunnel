extends Node

var curr_hp
var max_hp
var curr_meter_effect_1
var items = []
var equips = []
var atk = 5
var def = 5
var intel = 5 # Used for magic attacks, intelligence checks get applied throughout the game, affects speed for learning skills
var luck = 5 # Affects random misses, accuracy, critical hits, and is applied through the game for rolls 
var skill = 5
var speed = 5
var res = 5
var max_weight = 20
var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
