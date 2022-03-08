extends "res://character/Character.gd"
#Player.gd
signal moved

signal dead
signal grabbed_key
signal win

#func _ready():
#	can_move = true
	
func _process(delta):
#	если возможность движения есть то проверяем какая кнопка была нажата, 
#	и если была нажата то испускаем сигнал
	if can_move:
		for dir in moves.keys():
			if Input.is_action_pressed(dir):
				if move(dir):
					emit_signal('moved')

# 	проверяем столкновение
func _on_Player_area_entered(area):
	if area.is_in_group('enemies'):
		area.hide()
		set_process(false)
		$CollisionShape2D.disabled = true
		$AnimationPlayer2.play("die")
		yield($AnimationPlayer2, "animation_finished")
		emit_signal('dead')
		return
	if area.has_method('pickup'):
		area.pickup()
	if area.type == 'key_red':
		emit_signal('grabbed_key')
	if area.type == 'star':
		emit_signal('win')
	
