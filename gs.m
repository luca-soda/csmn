function [x, k] = gs(A, b, x0, kmax, tol)
    % Inizializza le dimensioni della matrice
    n = size(A, 1);
    
    % Inizializza la soluzione
    x = x0;
    
    % Calcola le matrici L e U
    L = tril(A);
    U = triu(A, 1);
    
    % Inizia le iterazioni
    for k = 1:kmax
        % Calcola la nuova soluzione
        x_new = inv(L) * (b - U*x);
        
        % Controlla la convergenza
        if norm(x_new - x, inf) / norm(x_new, inf) < tol
            x = x_new;
            return;
        end
        
        % Aggiorna la soluzione
        x = x_new;
    end
    
    % Se il codice arriva a questo punto, il metodo non è convergente
    error('Il metodo di Gauss-Seidel non converge entro il numero massimo di iterazioni')
end
