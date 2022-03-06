extends "res://character/Character.gd"

# случайное движение объекта
func _ready():
	can_move = false
	facing = moves.keys()[randi() % 4]
	yield(get_tree().create_timer(0.5), "timeout")
	
#func _process(delta):
#	if can_move:
#		if not move(facing) or randi() % 10 > 5:
#			facing = moves.keys()[randi() % 4]

#	подключаем Player как сцену и привязываем движение врага к движению игрока
func _on_Player_moved():
	if can_move:
		if not move(facing) or randi() % 10 > 5:
			facing = moves.keys()[randi() % 4]
