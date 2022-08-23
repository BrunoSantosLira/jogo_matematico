extends Control

var numero1 = null
var numero2 = null
var resultado = 0
var operacion = ""
var resul=1
var negativo= false
onready var res = $Resultado
onready var botao1 = $"Número1"
onready var botao2 = $"Número2"
onready var botao3 = $"Número3"


func realizar_operacion(op):
	if numero2 == null:
		numero2 = float(res.get_text())
	if numero1 != null:
		match op:
			"dividir":
				resultado = numero1 / numero2
				if resultado < 0 :
					if negativo == false:
						resultado = resultado * -1
					else:
						resultado= resultado
				res.set_text(str(resultado))
				
			"multiplicar":
				resultado = numero1 * numero2
				if resultado < 0 :
					if negativo == false:
						resultado = resultado * -1
					elif negativo:
						resultado= resultado
				res.set_text(str(resultado))
			
			"restar":
				resultado = numero1 - numero2
				if resultado < 0 :
					if negativo == false:
						resultado = resultado * -1
					elif negativo:
						resultado= resultado
				res.set_text(str(resultado))
				
			"sumar":
				resultado = numero1 + numero2
				if resultado < 0 :
					if negativo == false:
						resultado = resultado * -1
					elif negativo:
						resultado= resultado
				res.set_text(str(resultado))
				resul = res.set_text(str(resultado))
			
	numero1 = null
	numero2 = null


func _on_Nmero1_pressed():
	res.set_text(res.get_text() + botao1.text)
	botao1.hide()
	pass # Replace with function body.


func _on_Nmero2_pressed():
	res.set_text(res.get_text() + botao2.text)
	botao2.hide()
	pass # Replace with function body.


func _on_Nmero3_pressed():
	res.set_text(res.get_text() + botao3.text)
	botao3.hide()
	pass # Replace with function body.


func _on_Mais_pressed():
	operacion = "sumar"
	if numero1 == null:
		numero1 = float(res.get_text())
		res.set_text("")
	else:
		numero2 = float(res.get_text())
		realizar_operacion(operacion)
	pass # Replace with function body.


func _on_Diviso_pressed():
	operacion = "dividir"
	if numero1 == null:
		numero1 = float(res.get_text())
		res.set_text("")
	else:
		numero2 = float(res.get_text())
		realizar_operacion(operacion)
	pass # Replace with function body.


func _on_Multiplicao_pressed():
	operacion = "multiplicar"
	if numero1 == null:
		numero1 = float(res.get_text())
		res.set_text("")
	else:
		numero2 = float(res.get_text())
		realizar_operacion(operacion)
	pass # Replace with function body.


func _on_Apagar_pressed():
	numero1 = null
	numero2 = null
	botao1.show()
	botao2.show()
	botao3.show()
	res.set_text("")
	pass # Replace with function body.


func _on_Igual_pressed():
	realizar_operacion(operacion)
	pass # Replace with function body.


func _on_Subtrao_pressed():
	operacion = "restar"
	if numero1 == null:
		numero1 = float(res.get_text())
		res.set_text("")
	else:
		numero2 = float(res.get_text())
		realizar_operacion(operacion)
	pass # Replace with function body.
