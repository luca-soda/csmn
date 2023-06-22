# Informazioni generiche

## Creazioni matrici a catena

```matlab
dimensions = a:b:c
% a = partenza
% b = passo
% c = arrivo
```

## Errore relativo

Si trova anche nel repository, ma in ogni caso:
### Se è una matrice
```matlab
norm(approx_value-true_value) / norm(true_value)
```
### Se è un numero
```matlab
abs((true_value - approx_value) / true_value);
```

## Puntatore a funzione
```matlab
functionName = @(param1,param2) body;
```

## Rand, randi, randn
Numeri casuali uniformemente distribuiti &rarr; rand

Interi casuali uniformemente distribuiti (in un range) &rarr; randi

Numeri casuali con una distribuzione normale &rarr; randn

### Numeri pseudocasuali da 2 a 200 5x5
```matlab
% Con randi
R = randi([2,200], 5, 5)
% Con rand
R = 2 + (200-2).*rand(5);
```
## Matrice invertibile
```matlab
% Metodo 1
rank(A) == size(A,1);
% Metodo 2
det(A) > 1e-14;
```

## Creare numeri in un intervallo
```matlab
linspace(lowerInterval, upperInterval, quantity)
```
## Calcolo autovalori e raggio spettrale
```matlab
eig(A) % Autovalori
max(abs(eig(A))); % Raggio spettrale
```

## Generare i valori di Y in una funzione y = fun(x) date le X
```matlab
fun = @(x) sin(x)+cos(x)
```
diventa
```matlab
y = sin(X).+cos(X); % Non dimenticare i punti sopratutto per la moltiplicazione!
```

