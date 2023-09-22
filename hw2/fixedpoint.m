% Compute a fixed point g(x)=x
% g (input) : function to use
% x0 (input) : initial guess
% tol (input) : convergence tolerance
% maxIterations (input) : maximum number of iterations
% xc (output) : approximation to the fixed point
function xc = fixedpoint
 x0 = 0.6;
 tol = 10.^-5;
 maxIterations = 20;
 if abs(fdash(x0)) > 1
         fprintf('\n\nStarting value will not converge !!')   % Tests convergence of initial value
 else
 iterations = 0;          % max no. iterations.
 error = 1000;
 fprintf('\n\nIteration       x')
 
%-------------------- Runs Fixed Point iteration --------------------------
 
 while error > tol   
     x = f(x0);   % <-------- Can be changed for any of the functions below.
    
     error = abs(x - x0);  % Calculates error.
     
     iterations = iterations + 1; % Calculates iteration no.
     
     x0 = x;                % Replaces old value with new one.
     
     if iterations > maxIterations
         error = 0;
         disp('No Convergence found!')  % Halts algorithm after 10000 
     end                                               % iterations if convergence is
                                                       % not achieved.              
    fprintf('\n%5.0f%16.8f ', iterations, x)
 end                                                  
 
%-------------------- Ends iteration --------------------------------------
 
 fprintf('\n\nSolution = %2.8f\nAchieved convergence at iteration %2i\n\n ', x, iterations)  % Displays solution                         
 end
end

function F = f(x)
F = ((1-x)/3).^(1/3);  % defines function beforehand
end
function F = fdash(x)
F = diff(f(x));  % defines functions derivative beforehand
end