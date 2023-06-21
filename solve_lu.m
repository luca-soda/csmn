function v = solve_lu(L,U,b)
    y = L \ b;
    v = U \ y;
end