Algoritmo SignoDelNumero
	// Indica si un numero es positivo, negativo o cero
	Definir n Como Real;
	Escribir "Ingrese un numero:";
	Leer n;
	Si n > 0 Entonces
		Escribir "Positivo";
	Sino
		Si n < 0 Entonces
			Escribir "Negativo";
		Sino
			Escribir "Cero";
		FinSi
	FinSi
FinAlgoritmo
