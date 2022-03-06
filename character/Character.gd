extends Area2D

export (int) var speed = 3

var tile_size = 64
var can_move = true
var facing = 'right'
var moves = {
	'right': Vector2(1, 0),
	'left': Vector2(-1, 0),
	'up': Vector2(0, -1),
	'down': Vector2(0, 1)
}
onready var raycasts = {
	'right': $RayCastRight,
	'left': $RayCastLeft,
	'up': $RayCastUp,
	'down': $RayCastDown
}

func move(dir):
#	начинаем движение
	$AnimationPlayer.playback_speed = speed
	facing = dir
#	если сталкиваемся - выход из метода
	if raycasts[facing].is_colliding():
		return
#	can_move = false
	$AnimationPlayer.play(facing)
#	движение при помощи твин анимации
	$MoveTween.interpolate_property(
		self, 
		"position",
		position,
		position + moves[facing] * tile_size,
		1.0 / speed,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	$MoveTween.start()
	return true
	
func _on_MoveTween_tween_all_completed(object, key):
	can_move = true
