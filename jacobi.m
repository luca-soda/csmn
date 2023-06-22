function x = jacobi(A, b, x0, max_iter, toll)

    % Estrae la dimensione del vettore b, che è uguale al numero di righe di A
    N = length(b);
    
    % Inizializza il vettore soluzione con il vettore iniziale x0
    x = x0;
    
    % Inizia l'iterazione principale di Jacobi
    for k=1:max_iter
        % Per ogni riga della matrice A
        for i=1:N
            % Calcola la nuova approssimazione di x(i) utilizzando la formula di Jacobi:
            % x(i) = 1/a_ii * (b_i - \sum_{j ≠ i} a_ij * x(j))
            % dove a_ij sono gli elementi di A, x(j) è la j-esima componente del vettore soluzione all'iterazione precedente
            % e b_i è la i-esima componente del vettore dei termini noti.
            x(i) = (b(i)/A(i,i)) - (A(i,[1:i-1,i+1:N])*x0([1:i-1,i+1:N]))/A(i,i);
        end

        % Controlla se la soluzione ha raggiunto la tolleranza desiderata. Se la norma della differenza tra
        % la soluzione attuale e quella dell'iterazione precedente è minore o uguale alla tolleranza
        % moltiplicata per la norma della soluzione precedente, allora l'algoritmo è considerato convergente
        % e il ciclo si interrompe.
        if (norm(x - x0) <= toll*norm(x0))
            return
        end
        % Se la soluzione non ha raggiunto la tolleranza desiderata, aggiorna x0 con il vettore soluzione corrente
        % e continua con la prossima iterazione.
        x0=x;
    end

end
