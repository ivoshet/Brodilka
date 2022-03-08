extends Node
#Global
var score: int

var levels = [ 
	'res://levels/level_1/Level1.tscn',
	'res://levels/level_2/Level2.tscn'
]

var current_level

var start_screen = 'res://ui/StartScreen.tscn'
var end_screen = 'res://ui/GameOver.tscn'

func new_game():
	score = 0
	current_level = -1
	next_level()

func game_over():
	get_tree().change_scene(end_screen)
	
func next_level():
	current_level += 1
	if current_level >= Global.levels.size():
		game_over()
	else:
		get_tree().change_scene(levels[current_level])
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
