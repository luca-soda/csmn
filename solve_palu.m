function v = solve_palu(P,L,U,b)
    y = L \ (P*b);
    v = U \ y;
end