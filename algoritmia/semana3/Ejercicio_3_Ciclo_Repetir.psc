Algoritmo RepetirNumeros
    Definir numero Como Entero

    Repetir
        Escribir "Ingrese un numero (0 para terminar):"
        Leer numero
    Hasta Que numero = 0

    Escribir "Programa terminado"
FinAlgoritmo


//Tabla de traza
//Para ilustrar la ejecución, se ingresan 8, luego 3 y finalmente 0. El cuerpo se ejecuta al menos una vez y la condición se revisa después de cada lectura.
	//Vuelta	Entrada (numero)	¿numero = 0?	Acción
	//1	8	Falso	Continúa
	//2	3	Falso	Continúa
	//3	0	Verdadero	Termina el ciclo
	//Resultado esperado
	//Después de leer 0, el algoritmo muestra «Programa terminado».
