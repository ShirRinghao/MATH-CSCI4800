% Take a matrix as an input,  b
% Take a lower trianglar matrix as an input, L
% Take a upper trianglar matrix as an input, U
function x=luSolveNoPivoting(b, L, U)
n = length(L);
y = b;
for j = 2:n
    for i= 1:j-1
        y(j) = y(j) - y(i) * L(j,i);
    end
end
x = y;
x(n) = y(n) / U(n,n);
for j = n - 1:-1 : 1
    for i = j + 1:n
        x(j) = x(j) - x(i) * U(j, i);
    end
    x(j) = x(j) / U(j, j);
end
return