function [A, b] = gauss_elimination(A, b)
    % Input:
    % A: una matrice quadrata di dimensioni nxn
    % b: un vettore colonna di dimensione n
    % Output:
    % A: la matrice A triangolarizzata
    % b: il vettore b modificato di conseguenza

    [n, m] = size(A);
    
    for k = 1:n-1
        for i = k+1:n
            factor = A(i,k) / A(k,k);
            A(i,k:m) = A(i,k:m) - factor * A(k,k:m);
            b(i) = b(i) - factor * b(k);
        end
    end
end
