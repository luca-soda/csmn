function B = gauss_seidel_iteration_matrix(A)
    % Decomposizione della matrice A
    D = diag(diag(A));
    E = -tril(A, -1);
    F = -triu(A, 1);
    
    % Calcolo della matrice di iterazione B
    B = (D-E)\F;
end