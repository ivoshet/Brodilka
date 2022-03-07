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

# метод для движения, принимает направление 
# dir - направление движения
func move(dir):
#	задаем скорость анимации
	$AnimationPlayer.playback_speed = speed
#	перезадаем глобальную переменную направления движения facing
	facing = dir
#	если сталкиваемся - выход из метода, остановка движения
	if raycasts[facing].is_colliding():
		print("30 line")
		return 
#	задана возможность движения false, но объект не движется
	can_move = false
#	выбираем анимацию в соответствии с направлением движения
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
	


func _on_MoveTween_tween_completed(object, key):
	can_move = true
