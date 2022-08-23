extends Control

onready var texto= $Label
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_voltar_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass # Replace with function body.
