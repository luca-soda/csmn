function rho = calc_rho(M)
    rho = max(abs(eig(M)));
end