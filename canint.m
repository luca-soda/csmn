function valoriPolinomio = canint(ascisse, ordinate, ascisseInterpolazione)

ascisse = ascisse(:);
ordinate = ordinate(:);

numeroPunti = length(ascisse);

% Verifica se le ascisse e le ordinate hanno la stessa lunghezza
if numeroPunti ~= length(ordinate)
    error('Le ascisse e le ordinate devono avere la stessa lunghezza.')
end

% Costruisce la matrice X, i cui elementi sono le ascisse elevate alle potenze da 0 a n-1
MatriceX = zeros(numeroPunti);
for j = 1:numeroPunti
    MatriceX(:,j) = ascisse.^(j-1);
end

% Risolve il sistema lineare per ottenere i coefficienti del polinomio
coefficienti = MatriceX \ ordinate;

% Calcola i valori del polinomio interpolante per le ascisse di interpolazione
for i = 1:length(ascisseInterpolazione)
    somma = 0;
    for k = 1:numeroPunti
        somma = somma + coefficienti(k) * ascisseInterpolazione(i)^(k-1);
    end
    valoriPolinomio(i) = somma;
end

% Plotta il polinomio interpolante e i punti originali
plot(ascisseInterpolazione, valoriPolinomio, 'b', ascisse, ordinate, 'ro')
end
