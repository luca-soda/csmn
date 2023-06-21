function T = jacobi_iteration_matrix(A)
    D = diag(diag(A));
    R = A - D;
    T = -inv(D)*R;
end