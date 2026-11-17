Algoritmo AprobacionCurso
	// Aprueba si la nota es >= 3.0 Y la asistencia es >= 80%
	Definir nota, asistencia Como Real;
	Definir p, q Como Logico;
	Escribir "Ingrese la nota final (0 a 5):";
	Leer nota;
	Escribir "Ingrese el porcentaje de asistencia (0 a 100):";
	Leer asistencia;
	Si nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100 Entonces
		Escribir "Datos invalidos";
	Sino
		p <- (nota >= 3);
		q <- (asistencia >= 80);
		Si p Y q Entonces
			Escribir "Aprueba el curso";
		Sino
			Si p Entonces
				Escribir "Reprueba por inasistencia";
			Sino
				Si q Entonces
					Escribir "Reprueba por nota";
				Sino
					Escribir "Reprueba por nota y asistencia";
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo
