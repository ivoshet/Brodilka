extends Control
#StartScreen
func _ready():
	$AnimationPlayer.play("run_text")

func _input(event):
	if event.is_action_pressed('ui_select'):
		Global.new_game()
