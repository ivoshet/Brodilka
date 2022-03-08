extends Control
# WinScene

func _on_Timer_timeout():
	get_tree().change_scene(Global.start_screen)
