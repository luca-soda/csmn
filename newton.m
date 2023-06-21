function [soluzione, numIterazioni] = newton(fun, derivata, puntoIniziale, tolleranza, maxIterazioni)
% fun: funzione per la quale si vuole trovare la radice
% derivata: derivata della funzione
% puntoIniziale: punto di partenza per l'algoritmo di Newton
% tolleranza: criterio di arresto basato sulla differenza tra iterazioni successive
% maxIterazioni: numero massimo di iterazioni consentite

% Verifica se la soluzione iniziale è già una radice
if abs(fun(puntoIniziale)) < tolleranza
    soluzione = puntoIniziale;
    return;
end

% Verifica se la derivata si annulla in x0
if abs(derivata(puntoIniziale)) < tolleranza
    error('La derivata si annulla nel punto iniziale! L''algoritmo di Newton potrebbe non convergere.')
end

% Inizia l'iterazione di Newton
soluzione_corrente = puntoIniziale - (fun(puntoIniziale) / derivata(puntoIniziale));
numIterazioni = 1;
flag = 1;

while flag
    numIterazioni = numIterazioni + 1;
    puntoIniziale = soluzione_corrente;
    soluzione_corrente = puntoIniziale - (fun(puntoIniziale) / derivata(puntoIniziale));
    
    flag = (abs(soluzione_corrente - puntoIniziale) > abs(puntoIniziale)*tolleranza) && (abs(fun(soluzione_corrente)) > tolleranza) && (numIterazioni < maxIterazioni);
end

% Verifica se l'algoritmo ha raggiunto il numero massimo di iterazioni
if numIterazioni > maxIterazioni
    fprintf('Raggiunto il numero massimo di iterazioni. La soluzione potrebbe non essere accurata.\n')
end

soluzione = soluzione_corrente;
end
