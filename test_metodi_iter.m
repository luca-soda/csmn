for i=100:100:1000
    M = rand(i);
    M = alt_diagonally_dominant(M);
    x = ones(i,1);
    b = M * x;
    xj = jacobi(M,b,zeros(i,1),10000,1e-5);
    xgs = gs(M,b,zeros(i,1),10000,1e-5);
    fprintf("Condizionamento matrice: %g\n", cond(M));
    fprintf("---------- JACOBI ---------\n");
    [size1, size2] = size(M);
    fprintf("Dimensione matrice | %g\n",size1);
    fprintf("Raggio spettrale   | %g\n",calc_rho(jacobi_iteration_matrix(M)));
    fprintf("Errore relativo    | %g\n",norm(xj-x)/norm(x));
    fprintf("---------- Gauss Seidel ---------\n");
    fprintf("Dimensione matrice | %g\n",size1);
    fprintf("Raggio spettrale   | %g\n",calc_rho(gauss_seidel_iteration_matrix(M)));
    fprintf("Errore relativo    | %g\n",norm(xgs-x)/norm(x));
end
