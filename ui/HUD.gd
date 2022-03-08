extends CanvasLayer
# HUD

func _ready():
	get_node("MarginContainer/ScoreLabel").text = str(Global.score)
	
func update_score(value):
	Global.score += value
	$MarginContainer/ScoreLabel.text = str(Global.score)
