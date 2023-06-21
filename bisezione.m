function [root, numIter] = bisezione(fun, leftBound, rightBound, tolerance, maxIter)

    % Calcola i valori della funzione agli estremi dell'intervallo
    f_left = fun(leftBound);
    f_mid = fun(rightBound);

    % Verifica se la radice è contenuta nell'intervallo
    if f_left * f_mid > 0
        error('Non esistono radici nell''intervallo specificato [leftBound, rightBound]')
    end

    % Calcola il punto medio dell'intervallo e il suo valore funzionale
    midPoint = (leftBound + rightBound) / 2;
    f_mid = fun(midPoint);
    numIter = 1;

    % Verifica la condizione di arresto iniziale
    if abs(f_mid) < tolerance
        root = midPoint;
        return
    end

    % Ciclo principale dell'algoritmo
    while (abs(rightBound - leftBound) > tolerance) && (abs(f_mid) > tolerance) && (numIter < maxIter)
        % Se il prodotto è negativo, la radice si trova nel semintervallo sinistro
        if f_left * f_mid < 0
            rightBound = midPoint;
        % Altrimenti, la radice si trova nel semintervallo destro
        else
            leftBound = midPoint;
            f_left = f_mid;
        end

        % Calcola il nuovo punto medio e il suo valore funzionale
        midPoint = (leftBound + rightBound) / 2;
        f_mid = fun(midPoint);

        % Aggiorna il contatore delle iterazioni
        numIter = numIter + 1;
    end

    root = midPoint;

    % Verifica se l'algoritmo ha raggiunto il numero massimo di iterazioni
    if abs(f_mid) > tolerance
        if numIter >= maxIter
            fprintf('Raggiunto il numero massimo di iterazioni. La soluzione potrebbe non essere accurata.\n')
        end
    end
end
