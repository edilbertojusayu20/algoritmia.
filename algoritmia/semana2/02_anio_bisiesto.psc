Algoritmo AnioBisiesto
	// Un anio es bisiesto si es divisible entre 4 y NO entre 100,
	// o si es divisible entre 400
	Definir anio Como Entero;
	Definir p, q, r, esBisiesto Como Logico;
	Escribir "Ingrese un anio:";
	Leer anio;
	p <- (anio MOD 4 = 0);
	q <- (anio MOD 100 <> 0);
	r <- (anio MOD 400 = 0);
	esBisiesto <- (p Y q) O r;
	Si esBisiesto Entonces
		Escribir anio, " es bisiesto";
	Sino
		Escribir anio, " no es bisiesto";
	FinSi
FinAlgoritmo
