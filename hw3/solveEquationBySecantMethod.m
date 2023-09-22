% Find an approximate solution to a scalar equation
% f(x)=0
% by the Secant Method.
%
% f (input) : function f(x)
% x0,x1 (input) : initial guesses
% tol (input) : convergence tolerance
% xc (output) : approximate solution
% maxIterations (input) : maximum number of iterations
function [xc] = solveEquationBySecantMethod( f,x0,x1,tol,maxIterations )
k = 1;
fa = f(x0);
fb = f(x1);
while k <= maxIterations
    %Calculate the new x value and ratio
    xc = x1 - ((x1 - x0)/(fb - fa)) * fb;
    currratio = abs(fa)/ abs(fb);
    
    %Check if satisfies the tolerance
    fc = f(xc);
    error = abs(fc);
    if tol > error
        break
    end
    nextratio = abs(fc)/ abs(fb);
    p = log(nextratio)/log(currratio);
    fprintf("Secant: it=%2d: x=%13.6e f(x)=%9.2e ratio=%9.2e p=%4.2f\n",k,xc,fa,nextratio,p);
    
    %store the value for next iteration calculation
    x0 = x1;
    x1 = xc;
    fa = fb;
    fb = fc;
    k = k + 1;
    
    %Check if reaches the max iterations
    if k > maxIterations
        fprintf("Maximun iteration has reached")
    end
end
return