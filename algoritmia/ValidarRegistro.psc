Algoritmo ValidarRegistro
	Definir edad Como Entero
	Definir respuesta Como Caracter
	Escribir "¿Cuántos años tienes?"
	Leer edad
	Escribir "¿Aceptas los términos? (S/N)"
	Leer respuesta
	respuesta <- Mayúsculas(respuesta)
	Si edad >= 14 Y respuesta = "S" Entonces
		Escribir "Resgistro exitoso"
	SiNo
		Escribir "No puedes registrarte"
		
	FinSi
FinAlgoritmo

