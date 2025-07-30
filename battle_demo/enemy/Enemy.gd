extends Node2D

var curr_hp
const MAX_HP = 100

signal attack_declared(enemy_name, attack_name, attack_data)
signal enemy_dead(enemy_name)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curr_hp = MAX_HP
	pass # Replace with function body.

func load_enemy():
	# First, resolve the enemy name based on the node name
	


func select_attack():
	pass
	
func test():
	pass

func dead():
	enemy_dead.emit(self.name)

func handle_drop():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
