SubProceso DatosCliente(nombre Por Referencia)
    Escribir "Ingrese el nombre del cliente:"
    Leer nombre
FinSubProceso

SubProceso CalcularFactura(precio, cantidad, subtotal Por Referencia, iva Por Referencia, total Por Referencia)
    subtotal <- precio * cantidad
    iva <- subtotal * 0.19
    total <- subtotal + iva
FinSubProceso

SubProceso MostrarFactura(nombre, subtotal, iva, total)
    Escribir "------- FACTURA -------"
    Escribir "Cliente: ", nombre
    Escribir "Subtotal: $", subtotal
    Escribir "IVA (19%): $", iva
    Escribir "Total: $", total
FinSubProceso

Algoritmo SistemaFactura
    Definir nombre Como Cadena
    Definir precio, subtotal, iva, total Como Real
    Definir cantidad Como Entero

    DatosCliente(nombre)

    Escribir "Ingrese el precio unitario del producto:"
    Leer precio
    Escribir "Ingrese la cantidad:"
    Leer cantidad

    CalcularFactura(precio, cantidad, subtotal, iva, total)
    MostrarFactura(nombre, subtotal, iva, total)
FinAlgoritmo


//Tabla de traza
//En las cinco primeras comprobaciones se imprime i y luego se incrementa. La sexta comprobación encuentra i = 6 y detiene el ciclo.
//Comprobación	i al evaluar	i <= 5	Acción / i al terminar
//1	1	Verdadero	Imprime 1; i = 2
//5	5	Verdadero	Imprime 5; i = 6
//6	6	Falso	Termina; no imprime
//Resultado esperado
//La salida presenta, en orden, 1, 2, 3, 4 y 5.//