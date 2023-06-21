function [L, U] = gauss_lu(A)

% Recupera le dimensioni della matrice A
[n, m] = size(A);

if n ~= m
    error('La matrice A deve essere quadrata.');
end

% Inizializza le matrici L e U
L = eye(n); % Matrice identità nxn
U = A; % Copia la matrice A

for k = 1:n-1
    % Controllo per la presenza di zeri sulla diagonale
    if U(k, k) == 0
        error('Zeri sulla diagonale principale, il pivoting è necessario.');
    end

    for i = k+1:n
        L(i, k) = U(i, k) / U(k, k); % Calcolo gli elementi di L
        U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n); % Aggiorno gli elementi di U
    end
end

end
