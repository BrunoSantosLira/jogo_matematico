extends Node2D

onready var resultado = $Game/dados/Calculadora/Resultado
onready var botao1 = $"Game/dados/Calculadora/Número1"
onready var botao2 = $"Game/dados/Calculadora/Número2"
onready var botao3 = $"Game/dados/Calculadora/Número3"

#posições
onready var posicao1= $StarRed/Casa1Red
onready var posicao2= $StarRed/Casa2Red
onready var posicao3= $StarRed/Casa3Red
var lista= [posicao1,posicao2,posicao3]

var posicao = "1"

func _ready():
	pass 


func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		if resultado.text == posicao:
			if posicao == "6":
				$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
			if posicao == "9":
				$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
			if posicao == "10":
				$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-30)
			$StarRed.global_position = $StarRed/Casa1Red.global_position
			posicao = int(posicao)
			posicao += 1
			posicao = str(posicao)
			botao1.show()
			botao2.show()
			botao3.show()
		else:
			print('não é')
	if Input.is_action_just_pressed("ui_home"):
		print(posicao,"posição")
		$StarRed.global_position = $StarRed/Casa1Red.global_position
		posicao = int(posicao)
		posicao += 1
		posicao = str(posicao)
		print(posicao,"posição")
		if posicao == "6":
			$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
		if posicao == "9":
			$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
		if posicao == "10":
			$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-30)
	pass
