function [P, L, U] = gauss_palu(A)
    % Input:
    % A: una matrice quadrata di dimensioni nxn
    % Output:
    % P: matrice di permutazione nxn
    % L: matrice triangolare inferiore di dimensioni nxn
    % U: matrice triangolare superiore di dimensioni nxn

    % Dimensione della matrice
    n = size(A,1);
    
    % Inizializzazione delle matrici P, L, ed U
    P = eye(n); 
    L = eye(n); 
    U = A; 

    for k = 1:n-1
        % Pivoting parziale
        [~, m] = max(abs(U(k:n,k)));
        m = m + k - 1;
        if m ~= k
            % Scambio le righe m e k in U
            U([k, m],:) = U([m, k],:);
            % Scambio le righe m e k in P
            P([k, m],:) = P([m, k],:);
            if k >= 2
                % Scambio le righe m e k in L
                L([k, m],1:k-1) = L([m, k],1:k-1);
            end
        end

        for i = k+1:n
            % Calcolo del moltiplicatore
            L(i,k) = U(i,k)/U(k,k);
            % Aggiornamento della riga i-esima della matrice U
            U(i,k:n) = U(i,k:n) - L(i,k) * U(k,k:n);
        end
    end
end
