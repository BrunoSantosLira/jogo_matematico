extends Node2D

onready var resultado = $Game/dados/Calculadora/Resultado
onready var botao1 = $"Game/dados/Calculadora/Número1"
onready var botao2 = $"Game/dados/Calculadora/Número2"
onready var botao3 = $"Game/dados/Calculadora/Número3"
onready var label_resultado = $Game/dados/Calculadora/Resultado
onready var barraMeio = $BarraDoMeio
onready var barra2 = $BarraDoMeio2

var dado1= preload("res://Node2D2222.tscn")
var dado2 = preload("res://Dados.tscn")
var dado3 = preload("res://cenas_dados/dado3.tscn")
var dado4 = preload("res://cenas_dados/dado4.tscn")
var dado5 = preload("res://cenas_dados/dado5.tscn")
var dado6= preload("res://cenas_dados/dado6.tscn")
var lista = [dado2,dado1,dado3,dado4,dado5,dado6] 

onready var botao1_jogadores= $"Game/dados/Calculadora/Número1"
onready var botao2_jogadores= $"Game/dados/Calculadora/Número2"
onready var botao3_jogadores= $"Game/dados/Calculadora/Número3"
onready var papapa = $"/root/Vitoria/Label"

#posições
onready var posicao1= $StarRed/Casa1Red
onready var posicao2= $StarGreen/Casa1Green
onready var posicao3= $StarBlue/Casa1Blue
onready var dadinho = $Game/dados/DadosAnim

var posicao = "1"
var contadora = 1
var acertosRed = "1"
var acertosGreen = "1"
var acertosBlue = "1"
var para= 1
var errado= false
var inicio= 1
var rng= RandomNumberGenerator.new()

func _MudarDadoCima():
		yield(get_tree().create_timer(1.0), "timeout")
		rng.randomize()
		var random= rng.randi_range(0,5)#Gerando números aleatórios inteiros(zero funciona)
		var teste = lista[random].instance()
		var numero_real1 = random +1
		botao1_jogadores.text = str(numero_real1)
		get_parent().add_child(teste)
		teste.global_position = $Game/dados/Posicao1.global_position
		$Game/dados/DadosAnim.global_position.y=2422
		$Game/dados/DadosAnim.global_position.y=1187
		yield(get_tree().create_timer(1.0), "timeout")
		
		
		rng.randomize()
		random= rng.randi_range(0,5) #Gerando números aleatórios inteiros(zero funciona)
		teste = lista[random].instance()
		var numero_real2 = random +1
		botao2_jogadores.text = str(numero_real2)
		get_parent().add_child(teste)
		teste.global_position = $Game/dados/posicao2.global_position
		$Game/dados/DadosAnim.global_position.y=2422
		$Game/dados/DadosAnim.global_position.y=1187
		yield(get_tree().create_timer(1.0), "timeout")
		
		rng.randomize()
		random= rng.randi_range(0,5) #Gerando números aleatórios inteiros(zero funciona)
		teste = lista[random].instance()
		var numero_real3 = random +1 
		botao3_jogadores.text = str(numero_real3)
		get_parent().add_child(teste)
		teste.global_position = $Game/dados/posicao3.global_position
		$Game/dados/DadosAnim.global_position.y=2422
		return numero_real3
		
		pass

#---------------STAR Red--------------------			
func _StarRed():
	barraMeio.text= "Próxima Casa:" + acertosRed
	if inicio == 1:
		barra2.text="Turno: Vermelho"
	if Input.is_action_just_pressed("ui_down"):
		inicio= 2
		if resultado.text == acertosRed:
			if acertosRed == "6":
				$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
			if acertosRed == "9":
				$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
			if acertosRed == "10":
				$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-30)
			$StarRed.global_position = $StarRed/Casa1Red.global_position
			acertosRed = int(acertosRed)
			acertosRed += 1
			acertosRed = str(acertosRed)
			print(acertosRed,"acertos aqui!")
			botao1.show()
			botao2.show()
			botao3.show()
			contadora +=1
			label_resultado.text=""
			barra2.text= "Resposta anterior\n Certa!\n Turno: Verde"
			_MudarDadoCima()
		else:
			_MudarDadoCima()
			botao1.show()
			botao2.show()
			botao3.show()
			label_resultado.text=""
			barra2.text= "Resposta anterior\n Errada!\n Turno: Verde"
			contadora +=1
	if Input.is_action_just_pressed("ui_home"):
		print(posicao,"posição")
		$StarRed.global_position = $StarRed/Casa1Red.global_position
		acertosRed = int(acertosRed)
		acertosRed += 1
		acertosRed = str(acertosRed)
		print(posicao,"posição")
		if posicao == "6":
			$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
		if posicao == "9":
			$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-40)
		if posicao == "10":
			$StarRed.global_position = $StarRed/Casa1Red.global_position - Vector2(0,-30)
			
#---------------STAR GREEN--------------------			
func _StarGreen():
	barraMeio.text= "Próxima Casa:" + acertosGreen
	if Input.is_action_just_pressed("ui_down"):
		if resultado.text == acertosGreen:
			if acertosGreen == "6":
				$StarGreen.global_position = $StarGreen/Casa1Green.global_position - Vector2(0,-40)
			if posicao == "9":
				$StarGreen.global_position = $StarGreen/Casa1Green.global_position - Vector2(0,-40)
			if posicao == "10":
				$StarGreen.global_position = $StarGreen/Casa1Green.global_position - Vector2(0,-30)
			$StarGreen.global_position = $StarGreen/Casa1Green.global_position
			acertosGreen = int(acertosGreen)
			acertosGreen += 1
			acertosGreen = str(acertosGreen)
			botao1.show()
			botao2.show()
			botao3.show()
			contadora +=1
			label_resultado.text=""
			barra2.text= "Resposta anterior\n Certa!\n Turno: Azul"
			_MudarDadoCima()
		else:
			_MudarDadoCima()
			botao1.show()
			botao2.show()
			botao3.show()
			label_resultado.text=""
			barra2.text= "Resposta anterior\n Errada!\n Turno: Azul"
			contadora +=1
	if Input.is_action_just_pressed("ui_home"):
		print(posicao,"posição")
		$StarGreen.global_position = $StarGreen/Casa1Green.global_position
		acertosGreen = int(acertosGreen)
		acertosGreen += 1
		acertosGreen = str(acertosGreen)
		print(posicao,"posição")
		if posicao == "6":
			$StarGreen.global_position = $StarGreen/Casa1Green.global_position - Vector2(0,-40)
		if posicao == "9":
			$StarGreen.global_position = $StarGreen/Casa1Green.global_position - Vector2(0,-40)
		if posicao == "10":
			$StarGreen.global_position = $StarGreen/Casa1Green.global_position - Vector2(0,-30)
	pass
			
#---------------STAR Blue--------------------
func _StarBlue():
	barraMeio.text= "Próxima Casa:" + acertosBlue
	if Input.is_action_just_pressed("ui_down"):
		if resultado.text == acertosBlue:
			if posicao == "6":
				$StarBlue.global_position = $StarBlue/Casa1Blue.global_position - Vector2(0,-40)
			if posicao == "9":
				$StarBlue.global_position = $StarBlue/Casa1Blue.global_position - Vector2(0,-40)
			if posicao == "10":
				$StarBlue.global_position = $StarBlue/Casa1Blue.global_position - Vector2(0,-30)
			$StarBlue.global_position = $StarBlue/Casa1Blue.global_position
			acertosBlue = int(acertosBlue)
			acertosBlue += 1
			acertosBlue = str(acertosBlue)
			botao1.show()
			botao2.show()
			botao3.show()
			contadora = 1
			label_resultado.text=""
			barra2.text= "Resposta anterior\n Certa!\n Turno: Vermelho"
			_MudarDadoCima()
		else:
			_MudarDadoCima()
			botao1.show()
			botao2.show()
			botao3.show()
			label_resultado.text=""
			barra2.text= "Resposta anterior\n Errada!\n Turno: Vermelho"
			contadora = 1
	if Input.is_action_just_pressed("ui_home"):
		print(posicao,"posição")
		$StarBlue.global_position = $StarBlue/Casa1Blue.global_position
		acertosBlue = int(acertosBlue)
		acertosBlue += 1
		acertosBlue = str(acertosBlue)
		print(posicao,"posição")
		if posicao == "6":
			$StarBlue.global_position = $StarBlue/Casa1Blue.global_position - Vector2(0,-60)
		if posicao == "9":
			$StarBlue.global_position = $StarBlue/Casa1Blue.global_position - Vector2(0,-40)
		if posicao == "10":
			$StarBlue.global_position = $StarBlue/Casa1Blue.global_position - Vector2(0,-30)
	pass	

func _ready():
	pass 

func _process(delta):
	if para == 1:
		_MudarDadoCima()
		para +=1
	if contadora == 1:
		_StarRed()
	elif contadora == 2:
		_StarGreen()
	elif contadora == 3:
		_StarBlue()
	if acertosRed == "11":
		get_tree().change_scene("res://Vitória_red.tscn")
	if acertosBlue == "11":
		get_tree().change_scene("res://Vitória_azul.tscn")
	if acertosGreen == "11":
		get_tree().change_scene("res://Vitória_verde.tscn")
	pass
