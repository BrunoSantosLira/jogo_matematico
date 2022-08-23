extends Node2D

const dado1= preload("res://Dados.tscn")

onready var animacao= $AnimationPlayer

func _RolarDados():
	if Input.is_action_just_pressed("ui_accept"):
		animacao.play("Dados_rolando")

func _ready():
	pass 

func _process(delta):
	_RolarDados()
	var teste22 = dado1.instance()
	get_parent().add_child(teste22)
		 
	
	pass
