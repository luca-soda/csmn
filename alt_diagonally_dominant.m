function A = alt_diagonally_dominant(A)
    A = A - diag(diag(A));
    s = sum(abs(A'));
    s = s*3;
    A = A + diag(s);
end