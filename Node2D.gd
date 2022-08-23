extends Node2D

#dados
var dado1= preload("res://Node2D2222.tscn")
var dado2 = preload("res://Dados.tscn")
var dado3 = preload("res://cenas_dados/dado3.tscn")
var dado4 = preload("res://cenas_dados/dado4.tscn")
var dado5 = preload("res://cenas_dados/dado5.tscn")
var dado6= preload("res://cenas_dados/dado6.tscn")
var lista = [dado2,dado1,dado3,dado4,dado5,dado6]  #Lembre-se index 0 = dado1

onready var animacao = $DadosAnim/AnimationPlayer
onready var timer = $Timer
onready var botao1 = $"Calculadora/Número1"
onready var botao2 = $"Calculadora/Número2"
onready var botao3=  $"Calculadora/Número3"

func _rolar():
	animacao.play("dados_rolando")
	pass

func _dadovoltar():
	$DadosAnim.global_position.y = 1250
	
	
	
func _Dadodireita():
		var random= int(rand_range(0,6)) #Gerando números aleatórios inteiros(zero funciona)
		var teste = lista[random].instance()
		var numero_real3 = random +1 
		print(random)
		print(numero_real3)
		botao3.text = str(numero_real3)
		get_parent().add_child(teste)
		teste.global_position = $posicao3.global_position
		$DadosAnim.global_position.y=2422
		yield(get_tree().create_timer(3.0), "timeout")
		return numero_real3
		
func _Dadocima():
		var random= int(rand_range(0,6)) #Gerando números aleatórios inteiros(zero funciona)
		var teste = lista[random].instance()
		var numero_real2 = random +1
		botao2.text = str(numero_real2)
		print(numero_real2)
		get_parent().add_child(teste)
		teste.global_position = $posicao2.global_position
		$DadosAnim.global_position.y=2422
		yield(get_tree().create_timer(3.0), "timeout")
		$DadosAnim.global_position.y=1187
		
func _dadoesquerda():
		var random= int(rand_range(0,6)) #Gerando números aleatórios inteiros(zero funciona)
		var teste = lista[random].instance()
		var numero_real1 = random +1
		print(numero_real1)
		botao1.text = str(numero_real1)
		get_parent().add_child(teste)
		teste.global_position = $Posicao1.global_position
		$DadosAnim.global_position.y=2422
		yield(get_tree().create_timer(3.0), "timeout")
		$DadosAnim.global_position.y=1187
		
func _ready():
	pass 
	
#espera : yield(get_tree().create_timer(1.0), "timeout")
#Posição da animação do dado
#x=150
#1717
func _process(delta):
	
	_rolar()
	if Input.is_action_just_pressed("ui_left"):
		_dadoesquerda()
		
	if Input.is_action_just_pressed("ui_up"):
		_Dadocima()
	
	if Input.is_action_just_pressed("ui_right"):
		_Dadodireita()
	
	pass

	

