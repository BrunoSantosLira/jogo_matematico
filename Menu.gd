extends Control




func _on_START_pressed():
	get_tree().change_scene("res://Node2D.tscn")
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	get_tree().change_scene("res://Help.tscn")
	pass # Replace with function body.
