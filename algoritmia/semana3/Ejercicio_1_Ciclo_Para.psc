Algoritmo Numeros
	Definir i Como Entero;
	
	Para i <- 1 Hasta 5 Con Paso 1 Hacer
		Escribir i;
	FinPara
	
FinAlgoritmo
//Tabla de traza
//En las cinco primeras comprobaciones se imprime i y luego se incrementa. La sexta comprobación encuentra i = 6 y detiene el ciclo.
//Comprobación	i al evaluar	i <= 5	Acción / i al terminar
//1	1	Verdadero	Imprime 1; i = 2
//5	5	Verdadero	Imprime 5; i = 6
//6	6	Falso	Termina; no imprime
//Resultado esperado
//La salida presenta, en orden, 1, 2, 3, 4 y 5.