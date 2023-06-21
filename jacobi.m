function [solution,iterations] = jacobi(system_matrix,known_terms,initial_approx,max_iterations,tolerance)
% jacobi_method applica il metodo di Jacobi per risolvere un sistema lineare
%
% Input:
% system_matrix: Matrice del sistema
% known_terms: Vettore dei termini noti
% initial_approx: Approssimazione iniziale della soluzione (default: vettore di zeri)
% tolerance: Tolleranza per il criterio di arresto (default: 1e-5)
% max_iterations: Numero massimo di iterazioni (default: 100)
%
% Output:
% solution: Approssimazione della soluzione
% iterations: Numero di iterazioni effettuate

% Controllo dei parametri in input e assegnazione valori di default
if (nargin < 5), max_iterations = 100; end
if (nargin < 4), tolerance = 1e-5; end
if (nargin < 3), initial_approx = zeros(size(known_terms)); end

% Controllo che la matrice sia diagonalmente dominante
diag_dominant = all(2*abs(diag(system_matrix)) >= sum(abs(system_matrix),2));
if ~diag_dominant
    error('La matrice del sistema non è diagonalmente dominante.');
end

% Decomposizione della matrice A in D, E, F
diagonal_matrix = diag(diag(system_matrix)); % Matrice diagonale D
lower_matrix = -tril(system_matrix,-1); % Parte inferiore E
upper_matrix = -triu(system_matrix,1); % Parte superiore F

% Calcolo della matrice di iterazione B e del vettore f
iteration_matrix = diagonal_matrix\(lower_matrix + upper_matrix);
iteration_vector = diagonal_matrix\known_terms;

% Inizializzazione
stop_criteria = 1;
iterations = 0;
new_approx = initial_approx;

% Ciclo di iterazione
while stop_criteria
    old_approx = new_approx;
    new_approx = iteration_matrix*old_approx + iteration_vector;
    iterations = iterations + 1;
    stop_criteria = (norm(new_approx - old_approx) > tolerance*norm(old_approx)) && (iterations < max_iterations);
end

solution = new_approx;

end
