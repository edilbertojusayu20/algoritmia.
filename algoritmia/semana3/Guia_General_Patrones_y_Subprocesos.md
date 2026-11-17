# Patrones de repetición y descomposición de problemas

## Propósito

Este material reúne tres algoritmos de repetición en PSeInt y un ejemplo de descomposición de un sistema de facturación. Cada ejercicio cuenta con un documento independiente; este archivo sirve como guía general y resumen.

## 1. Ciclo Para

**Problema:** mostrar los números del 1 al 5. `Para` se usa cuando se conoce de antemano cuántas veces se repetirá una acción.

```pseint
Algoritmo Numeros
    Definir i Como Entero
    Para i <- 1 Hasta 5 Hacer
        Escribir i
    FinPara
FinAlgoritmo
```

| Iteración | i | Salida |
|---:|---:|---:|
| 1 | 1 | 1 |
| 2 | 2 | 2 |
| 3 | 3 | 3 |
| 4 | 4 | 4 |
| 5 | 5 | 5 |

**Documento individual:** `Ejercicio_1_Ciclo_Para.docx`.

## 2. Ciclo Mientras

**Problema:** mostrar los números del 1 al 5. `Mientras` comprueba primero una condición; por eso requiere inicializar `i` antes del ciclo e incrementarla dentro del cuerpo.

```pseint
Algoritmo NumerosMientras
    Definir i Como Entero
    i <- 1
    Mientras i <= 5 Hacer
        Escribir i
        i <- i + 1
    FinMientras
FinAlgoritmo
```

| Comprobación | i al evaluar | Condición | Acción / estado final |
|---:|---:|---|---|
| 1 | 1 | Verdadero | Imprime 1; i = 2 |
| 2 | 2 | Verdadero | Imprime 2; i = 3 |
| 3 | 3 | Verdadero | Imprime 3; i = 4 |
| 4 | 4 | Verdadero | Imprime 4; i = 5 |
| 5 | 5 | Verdadero | Imprime 5; i = 6 |
| 6 | 6 | Falso | Termina sin imprimir |

**Documento individual:** `Ejercicio_2_Ciclo_Mientras.docx`.

## 3. Ciclo Repetir Hasta Que

**Problema:** solicitar números hasta que se ingrese 0. Este ciclo ejecuta primero el cuerpo y evalúa la condición al final, de modo que siempre solicita al menos un número.

```pseint
Algoritmo RepetirNumeros
    Definir numero Como Entero
    Repetir
        Escribir "Ingrese un numero:"
        Leer numero
    Hasta Que numero = 0
    Escribir "Programa terminado"
FinAlgoritmo
```

Traza ilustrativa con entradas 8, 3 y 0:

| Vuelta | Entrada | ¿numero = 0? | Acción |
|---:|---:|---|---|
| 1 | 8 | Falso | Continúa |
| 2 | 3 | Falso | Continúa |
| 3 | 0 | Verdadero | Termina el ciclo |

**Documento individual:** `Ejercicio_3_Ciclo_Repetir.docx`.

## 4. Factura descompuesta en SubProcesos

La solución separa el trabajo en captura de datos, cálculo y presentación. El IVA se calcula al 19 %; los resultados del cálculo se pasan por referencia para que queden disponibles en el algoritmo principal.

```pseint
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
    Escribir "IVA: $", iva
    Escribir "Total: $", total
FinSubProceso

Algoritmo SistemaFactura
    Definir nombre Como Cadena
    Definir precio, subtotal, iva, total Como Real
    Definir cantidad Como Entero
    DatosCliente(nombre)
    Escribir "Ingrese el precio del producto:"
    Leer precio
    Escribir "Ingrese la cantidad:"
    Leer cantidad
    CalcularFactura(precio, cantidad, subtotal, iva, total)
    MostrarFactura(nombre, subtotal, iva, total)
FinAlgoritmo
```

Árbol de componentes:

```text
Sistema de facturación
├── Capturar datos del cliente
│   └── DatosCliente(nombre)
├── Capturar datos del producto
│   ├── Leer precio
│   └── Leer cantidad
├── Calcular valores
│   └── CalcularFactura(precio, cantidad, subtotal, iva, total)
│       ├── subtotal = precio × cantidad
│       ├── iva = subtotal × 0,19
│       └── total = subtotal + iva
└── Presentar factura
    └── MostrarFactura(nombre, subtotal, iva, total)
```

| Concepto | Valor |
|---|---:|
| Cliente | Carlos |
| Precio unitario | $10.000 |
| Cantidad | 3 |
| Subtotal | $30.000 |
| IVA (19 %) | $5.700 |
| **Total** | **$35.700** |

**Documento individual:** `Ejercicio_4_Factura_SubProcesos.docx`.

## Ideas clave

- `Para` encaja con repeticiones contadas; `Mientras` repite mientras una condición inicial siga siendo verdadera; `Repetir Hasta Que` ejecuta el cuerpo y luego verifica cuándo detenerse.
- Una tabla de traza permite seguir el valor de las variables, evaluar condiciones y comprobar las salidas.
- Los SubProcesos separan responsabilidades: cada parte resuelve una tarea concreta y el algoritmo principal coordina el flujo.
