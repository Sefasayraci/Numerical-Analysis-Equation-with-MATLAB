function [error,solution] = Gauss_Seidel(x,y,initial_guess,tol)
    [n temp] = size(y); %number of equations
    solution = initial_guess; %create a solution matrix starting from zero
    
    A = [x y];
    error = tol+1; %assigned initial value to start the loop.
    
 while  error > tol %check whether the tolerance is exceeded or not
    error = 0;
    for i = 1 : n 
       s = 0;
       for j = 1 : n 
          s = s-A(i,j)*solution(j);
       end
       s = (s+A(i,n+1))/A(i,i);
       if abs(s) > error 
         error  = abs(s);
       end
       solution(i) = solution(i) + s;
    end
 end 
    solution %print out solutions
    fprintf("Solution vector for an error of less than %f\n",tol);
    error
    fprintf("Error value for the solution found above\n");
end
