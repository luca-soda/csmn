function x = solve_diag_system(D, b)
    % Input: D è una matrice diagonale, b è il vettore dei termini noti
    % Output: x è la soluzione del sistema Dx = b

    % Preallocazione del vettore soluzione
    x = zeros(size(b));

    % Calcolo della soluzione
    for i = 1:length(b)
        x(i) = b(i) / D(i, i);
    end
end