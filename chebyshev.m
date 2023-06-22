function x = chebyshev(n)
    % L'input è 'n' che rappresenta il grado del polinomio di Chebyshev. L'output è 'x' che è un vettore contenente le radici del polinomio.
    k = (0:n);
    x = cos((2*k+1)./(2*(n+1))*pi);
end