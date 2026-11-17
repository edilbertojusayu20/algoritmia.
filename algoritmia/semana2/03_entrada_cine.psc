Algoritmo EntradaCine
	// Precio de la entrada segun la edad:
	// menores de 5 gratis, menores de 12 o de 60 en adelante pagan la mitad
	Definir edad Como Entero;
	Definir precioBase, precioFinal Como Real;
	precioBase <- 12000;
	Escribir "Ingrese la edad del visitante:";
	Leer edad;
	Si edad < 0 O edad > 120 Entonces
		Escribir "Edad invalida";
	Sino
		Si edad < 5 Entonces
			precioFinal <- 0;
			Escribir "Entrada gratis";
		Sino
			Si edad < 12 O edad >= 60 Entonces
				precioFinal <- precioBase * 0.5;
				Escribir "Descuento del 50%. Total a pagar: ", precioFinal;
			Sino
				precioFinal <- precioBase;
				Escribir "Tarifa completa. Total a pagar: ", precioFinal;
			FinSi
		FinSi
	FinSi
FinAlgoritmo
