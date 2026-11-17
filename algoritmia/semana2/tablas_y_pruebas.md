# Algoritmos de decisión en PSeInt

Lógica proposicional y estructuras de decisión: cada algoritmo trae su tabla de verdad o de decisión y una prueba de escritorio con casos normales, borde e inválidos.

- **V** = Verdadero, **F** = Falso, **—** = no importa (la condición no se evalúa).
- **Borde**: dato justo en el límite de una condición (donde más se cometen errores). **Inválido**: dato fuera del rango permitido.
- La columna "Salida esperada" se calculó a mano, antes de ejecutar el algoritmo.

## 1. Signo de un número (`01_signo_numero.psc`)

**Problema:** Leer un número e indicar si es positivo, negativo o cero.

**Proposiciones y condiciones**

- C1: `n > 0`
- C2: `n < 0`
- Si ninguna es verdadera, el número es cero.

**Tabla de decisión**

| Regla | C1: n > 0 | C2: n < 0 | Acción |
|:-:|:-:|:-:|---|
| R1 | V | — | Escribir "Positivo" |
| R2 | F | V | Escribir "Negativo" |
| R3 | F | F | Escribir "Cero" |

C1 = V y C2 = V a la vez es imposible: un número no puede ser mayor y menor que 0 al mismo tiempo.

**Código**

```text
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
```

**Prueba de escritorio**

| # | Tipo | Entradas | Variables calculadas | Condiciones evaluadas (en orden) | Salida esperada | Salida del algoritmo | Resultado |
|:-:|:-:|---|---|---|---|---|:-:|
| 1 | Normal | n=5 | — | `n > 0` → V | Positivo | Positivo | OK |
| 2 | Normal | n=-3 | — | `n > 0` → F<br>`n < 0` → V | Negativo | Negativo | OK |
| 3 | Borde | n=0 | — | `n > 0` → F<br>`n < 0` → F | Cero | Cero | OK |
| 4 | Borde | n=0.001 | — | `n > 0` → V | Positivo | Positivo | OK |
| 5 | Borde | n=-0.001 | — | `n > 0` → F<br>`n < 0` → V | Negativo | Negativo | OK |

## 2. Año bisiesto (`02_anio_bisiesto.psc`)

**Problema:** Leer un año e indicar si es bisiesto.

**Proposiciones y condiciones**

- p: el año es divisible entre 4
- q: el año NO es divisible entre 100
- r: el año es divisible entre 400
- Fórmula: **(p ∧ q) ∨ r**  (en PSeInt: `(p Y q) O r`)

**Tabla de verdad**

| p: divisible entre 4 | q: NO divisible entre 100 | r: divisible entre 400 | p ∧ q | (p ∧ q) ∨ r | Resultado | Año de ejemplo |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| V | V | V | V | V | Bisiesto | imposible (ningún año cumple esto) |
| V | V | F | V | V | Bisiesto | 2024 |
| V | F | V | F | V | Bisiesto | 2000 |
| V | F | F | F | F | No bisiesto | 1900 |
| F | V | V | F | V | Bisiesto | imposible (ningún año cumple esto) |
| F | V | F | F | F | No bisiesto | 2023 |
| F | F | V | F | V | Bisiesto | imposible (ningún año cumple esto) |
| F | F | F | F | F | No bisiesto | imposible (ningún año cumple esto) |

Las filas "imposible" existen en la lógica pero ningún año las cumple (por ejemplo, un año divisible entre 400 siempre es divisible entre 100, así que r = V obliga a q = F).

**Código**

```text
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
```

**Prueba de escritorio**

| # | Tipo | Entradas | Variables calculadas | Condiciones evaluadas (en orden) | Salida esperada | Salida del algoritmo | Resultado |
|:-:|:-:|---|---|---|---|---|:-:|
| 1 | Normal | anio=2024 | p=V, q=V, r=F, esBisiesto=V | `esBisiesto` → V | 2024 es bisiesto | 2024 es bisiesto | OK |
| 2 | Normal | anio=2023 | p=F, q=V, r=F, esBisiesto=F | `esBisiesto` → F | 2023 no es bisiesto | 2023 no es bisiesto | OK |
| 3 | Borde | anio=1900 | p=V, q=F, r=F, esBisiesto=F | `esBisiesto` → F | 1900 no es bisiesto | 1900 no es bisiesto | OK |
| 4 | Borde | anio=2000 | p=V, q=F, r=V, esBisiesto=V | `esBisiesto` → V | 2000 es bisiesto | 2000 es bisiesto | OK |
| 5 | Borde | anio=2100 | p=V, q=F, r=F, esBisiesto=F | `esBisiesto` → F | 2100 no es bisiesto | 2100 no es bisiesto | OK |
| 6 | Borde | anio=4 | p=V, q=V, r=F, esBisiesto=V | `esBisiesto` → V | 4 es bisiesto | 4 es bisiesto | OK |

## 3. Entrada de cine por edad (`03_entrada_cine.psc`)

**Problema:** Según la edad: menores de 5 años no pagan, menores de 12 o de 60 en adelante pagan la mitad, los demás pagan la tarifa completa ($12000). Edades fuera de 0–120 son inválidas.

**Proposiciones y condiciones**

- C1: `edad < 0 O edad > 120`
- C2: `edad < 5`
- C3: `edad < 12 O edad >= 60`

**Tabla de decisión**

| Regla | C1: edad inválida (< 0 O > 120) | C2: edad < 5 | C3: edad < 12 O edad >= 60 | Acción |
|:-:|:-:|:-:|:-:|---|
| R1 | V | — | — | "Edad invalida" |
| R2 | F | V | — | "Entrada gratis" ($0) |
| R3 | F | F | V | Descuento del 50% ($6000) |
| R4 | F | F | F | Tarifa completa ($12000) |

El orden importa: C2 se revisa antes que C3, así que un niño de 3 años queda en R2 y no en R3.

Tabla de verdad de C3 (a = edad < 12, b = edad >= 60):

| a: edad < 12 | b: edad >= 60 | a ∨ b | Edad de ejemplo |
|:-:|:-:|:-:|:-:|
| V | V | V | imposible (nadie es menor de 12 y mayor de 60) |
| V | F | V | 8 |
| F | V | V | 70 |
| F | F | F | 30 |

**Código**

```text
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
```

**Prueba de escritorio**

| # | Tipo | Entradas | Variables calculadas | Condiciones evaluadas (en orden) | Salida esperada | Salida del algoritmo | Resultado |
|:-:|:-:|---|---|---|---|---|:-:|
| 1 | Normal | edad=30 | precioBase=12000, precioFinal=12000 | `edad < 0 O edad > 120` → F<br>`edad < 5` → F<br>`edad < 12 O edad >= 60` → F | Tarifa completa. Total a pagar: 12000 | Tarifa completa. Total a pagar: 12000 | OK |
| 2 | Borde | edad=0 | precioBase=12000, precioFinal=0 | `edad < 0 O edad > 120` → F<br>`edad < 5` → V | Entrada gratis | Entrada gratis | OK |
| 3 | Borde | edad=4 | precioBase=12000, precioFinal=0 | `edad < 0 O edad > 120` → F<br>`edad < 5` → V | Entrada gratis | Entrada gratis | OK |
| 4 | Borde | edad=5 | precioBase=12000, precioFinal=6000 | `edad < 0 O edad > 120` → F<br>`edad < 5` → F<br>`edad < 12 O edad >= 60` → V | Descuento del 50%. Total a pagar: 6000 | Descuento del 50%. Total a pagar: 6000 | OK |
| 5 | Borde | edad=11 | precioBase=12000, precioFinal=6000 | `edad < 0 O edad > 120` → F<br>`edad < 5` → F<br>`edad < 12 O edad >= 60` → V | Descuento del 50%. Total a pagar: 6000 | Descuento del 50%. Total a pagar: 6000 | OK |
| 6 | Borde | edad=12 | precioBase=12000, precioFinal=12000 | `edad < 0 O edad > 120` → F<br>`edad < 5` → F<br>`edad < 12 O edad >= 60` → F | Tarifa completa. Total a pagar: 12000 | Tarifa completa. Total a pagar: 12000 | OK |
| 7 | Borde | edad=59 | precioBase=12000, precioFinal=12000 | `edad < 0 O edad > 120` → F<br>`edad < 5` → F<br>`edad < 12 O edad >= 60` → F | Tarifa completa. Total a pagar: 12000 | Tarifa completa. Total a pagar: 12000 | OK |
| 8 | Borde | edad=60 | precioBase=12000, precioFinal=6000 | `edad < 0 O edad > 120` → F<br>`edad < 5` → F<br>`edad < 12 O edad >= 60` → V | Descuento del 50%. Total a pagar: 6000 | Descuento del 50%. Total a pagar: 6000 | OK |
| 9 | Borde | edad=120 | precioBase=12000, precioFinal=6000 | `edad < 0 O edad > 120` → F<br>`edad < 5` → F<br>`edad < 12 O edad >= 60` → V | Descuento del 50%. Total a pagar: 6000 | Descuento del 50%. Total a pagar: 6000 | OK |
| 10 | Inválido | edad=-1 | precioBase=12000 | `edad < 0 O edad > 120` → V | Edad invalida | Edad invalida | OK |
| 11 | Inválido | edad=121 | precioBase=12000 | `edad < 0 O edad > 120` → V | Edad invalida | Edad invalida | OK |

## 4. Aprobación de un curso (`04_aprobacion_curso.psc`)

**Problema:** Se aprueba si la nota es de 3.0 o más Y la asistencia es de 80% o más. Nota válida: 0 a 5. Asistencia válida: 0 a 100.

**Proposiciones y condiciones**

- p: `nota >= 3`
- q: `asistencia >= 80`
- Aprueba: **p ∧ q**  (en PSeInt: `p Y q`)

**Tabla de decisión**

| Regla | C0: datos fuera de rango | p: nota >= 3 | q: asistencia >= 80 | Acción |
|:-:|:-:|:-:|:-:|---|
| R1 | V | — | — | "Datos invalidos" |
| R2 | F | V | V | "Aprueba el curso" |
| R3 | F | V | F | "Reprueba por inasistencia" |
| R4 | F | F | V | "Reprueba por nota" |
| R5 | F | F | F | "Reprueba por nota y asistencia" |

Tabla de verdad de las proposiciones (cuando los datos son válidos):

| p: nota >= 3 | q: asistencia >= 80 | p ∧ q | Resultado | Ejemplo |
|:-:|:-:|:-:|---|---|
| V | V | V | Aprueba el curso | nota 4.0, asistencia 90 |
| V | F | F | Reprueba por inasistencia | nota 4.0, asistencia 79 |
| F | V | F | Reprueba por nota | nota 2.99, asistencia 90 |
| F | F | F | Reprueba por nota y asistencia | nota 2.0, asistencia 50 |

**Código**

```text
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
```

**Prueba de escritorio**

| # | Tipo | Entradas | Variables calculadas | Condiciones evaluadas (en orden) | Salida esperada | Salida del algoritmo | Resultado |
|:-:|:-:|---|---|---|---|---|:-:|
| 1 | Normal | nota=4, asistencia=90 | p=V, q=V | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → V | Aprueba el curso | Aprueba el curso | OK |
| 2 | Borde | nota=3, asistencia=80 | p=V, q=V | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → V | Aprueba el curso | Aprueba el curso | OK |
| 3 | Borde | nota=5, asistencia=100 | p=V, q=V | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → V | Aprueba el curso | Aprueba el curso | OK |
| 4 | Borde | nota=2.99, asistencia=90 | p=F, q=V | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → F<br>`p` → F<br>`q` → V | Reprueba por nota | Reprueba por nota | OK |
| 5 | Borde | nota=4, asistencia=79 | p=V, q=F | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → F<br>`p` → V | Reprueba por inasistencia | Reprueba por inasistencia | OK |
| 6 | Borde | nota=3, asistencia=79 | p=V, q=F | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → F<br>`p` → V | Reprueba por inasistencia | Reprueba por inasistencia | OK |
| 7 | Normal | nota=2, asistencia=50 | p=F, q=F | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → F<br>`p` → F<br>`q` → F | Reprueba por nota y asistencia | Reprueba por nota y asistencia | OK |
| 8 | Borde | nota=0, asistencia=0 | p=F, q=F | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → F<br>`p Y q` → F<br>`p` → F<br>`q` → F | Reprueba por nota y asistencia | Reprueba por nota y asistencia | OK |
| 9 | Inválido | nota=5.1, asistencia=90 | — | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → V | Datos invalidos | Datos invalidos | OK |
| 10 | Inválido | nota=3.5, asistencia=101 | — | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → V | Datos invalidos | Datos invalidos | OK |
| 11 | Inválido | nota=-1, asistencia=50 | — | `nota < 0 O nota > 5 O asistencia < 0 O asistencia > 100` → V | Datos invalidos | Datos invalidos | OK |

## Verificación adicional (barridos)

Además de los casos de las tablas, se probaron muchos valores seguidos para detectar errores en los límites:

- Signo: enteros de -50 a 50: OK
- Bisiesto: años 1 a 4000 contra `calendar.isleap` de Python: OK
- Cine: edades 0 a 120 contra los rangos 0–4, 5–11, 12–59 y 60–120: OK

**Resumen:** 33 casos de escritorio, todos OK.
