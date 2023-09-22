% Tak a square matrix as an input
% Calculate L, lower trianglar matrix
% Calculate U, upper triangular matrix
function [L,U]=luFactorNoPivoting(A)
n=length(A);
U=A;
L=eye(n,n);
for j=1:n-1
    for i= j+1:n
        L(i,j)=U(i,j)/U(j,j);
        U(i,j:n)=U(i,j:n)-L(i,j)*U(j,j:n);
    end
end