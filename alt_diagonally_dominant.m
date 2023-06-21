function A = alt_diagonally_dominant(A)
    n = size(A, 1);
    for i = 1:n
        A(i,i) = A(i,i) + sum(abs(A(i,:))) + 1;
    end
end