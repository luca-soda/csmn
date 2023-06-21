function yy = lagrint(x, y, xx)
% INPUT:
% x: vettore delle ascisse dei punti da interpolare
% y: vettore delle ordinate dei punti da interpolare
% xx: vettore delle ascisse dei punti in cui calcolare il polinomio interpolante
%
% OUTPUT:
% yy: valutazione del polinomio interpolante nelle ascisse xx

% Assicurati che x e y siano vettori colonna
x = x(:);
y = y(:);

% Controlla che x e y abbiano la stessa lunghezza
if length(x) ~= length(y)
    error('Le ascisse e le ordinate devono avere la stessa lunghezza')
end

n = size(x,1);
denominatore = zeros(n,1);

% Calcola i denominatori per i polinomi di Lagrange
for j = 1:n
    denominatore(j) = prod(x(j) - x([1:j-1,j+1:end]));
end

m = size(xx,1);
yy = zeros(m,1);

% Calcola il polinomio interpolante di Lagrange per ogni ascissa in xx
for i = 1:m
    numeratore = prod(xx(i)-x)./(xx(i)-x);
    L = numeratore./denominatore;
    yy(i) = y'*L;
end

% Disegna il grafico del polinomio interpolante e dei punti originali
plot(x, y, 'or', xx, yy, 'b-')
legend('Punti da interpolare', 'Polinomio interpolante di Lagrange')
end
