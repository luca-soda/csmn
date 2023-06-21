function err = relative_error(true_value, approx_value)
    % Input: 
    % true_value è il valore vero o esatto
    % approx_value è il valore approssimato ottenuto dall'algoritmo
    %
    % Output: 
    % err è l'errore relativo calcolato
    
    % Calcolo dell'errore relativo
    err = abs((true_value - approx_value) / true_value);
end
