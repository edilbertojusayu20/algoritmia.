Algoritmo CompraConIVA
	// Calcula el total a pagar de una compra con IVA del 19%
	Definir precio, cantidad, subtotal, iva, total Como Real;
	Escribir "Ingrese el precio de un producto:";
	Leer precio;
	Escribir "Ingrese la cantidad de productos:";
	Leer cantidad;
	subtotal <- precio * cantidad;
	iva <- subtotal * 0.19;
	total <- subtotal + iva;
	Escribir "Subtotal: ", subtotal;
	Escribir "IVA (19%): ", iva;
	Escribir "Total a pagar: ", total;
FinAlgoritmo
