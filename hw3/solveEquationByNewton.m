%  Find an approximate solution to a scalar equation
%         f(x)=0
%  by Newton’s method
%
% f (input) : function f(x)
% fx (input) : function that defines f’(x)
% x0 (input) : initial guess
% tol (input) : convergence tolerance
% xc (output) : approximate solution
% maxIterations (input) : maximum number of iterations
function [xc] = solveEquationByNewton(f,fx,x0,tol,maxIterations)
k = 1;
xc = x0;
fc = f(xc);
while k <= maxIterations
    %Check if tolerance condition is satified
    if tol > abs(fc)
        break
    end
    
    %Calculate current x value and ratio
    xk = xc - f(xc)/fx(xc);
    currratio = abs(f(xk)) / abs(fc);
    
    %Output result
    if k==1  % do not print p first time
        fprintf("Newton: it=%2d: x=%13.6e f(x)=%9.2e ratio=%9.2e\n",k,xc,fc,currratio);
    else
        %Calculate order of convergence
        p = log(currratio)/log(Oldratio);
        fprintf("Newton: it=%2d: x=%13.6e f(x)=%9.2e ratio=%9.2e p=%4.2f\n",k,xc,fc,currratio,p);
    end
    
    %Store the current value for future computation
    Oldratio = currratio;
    xc = xk;
    fc = f(xc);
    k = k + 1;
    
    %Stop at maxIterations
    if k > maxIterations
        fprintf("Maximun number of iteration is reached")
        break
    end
end
return
