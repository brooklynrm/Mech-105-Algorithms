function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
%Created by: Brooklyn Murphy
%Created on: 12/02/2018

%Function description: This function is used to find the numerical solution
%   to the differential equation dydt

%Inputs:
%   dydt - differential function
%   tspan - span/length of the differential function
%   y0 - initial condition
%   h - step size being used

%Optional inputs: *only for iterations involving the predictor-corrector
%   es - stopping criterion (default to .001)
%   maxit - maximum number of iterations (default to 50)

%Outputs:
%   t - resulting value of the variable "t" in the differential equation
%   y - resulting value of the variable "y" in the differential equation

%Check to see if there are the correct number of input arguments
if nargin >6
    error('there are too many inputs for this function');
elseif nargin < 4
    error('there are not enough inputs for this function')
elseif nargin == 4
    es = .001; %Default for the stopping criterion
    maxit = 50; %Default for the number of iterations
end

%use input tspan  for range
initial = tspan(1);
final = tspan(2);
%find each step size being used for the function
%   make sure to use the transpose operon in order to have a column vector
t = (initial:h:final)';
%find the longest dimension/size of the vector, t
sz = max(size(t));

%make sure the range reaches from the inital to final value calculated
%   above
if t(sz) < final
    t(sz+1) = final;
    sz = sz+1;
end

%Fill in the vector y with ones, and as the function progresses, it will
%   replace those numbers with new values\
%use this to improve efficiency for the final output
y =  y0*ones(sz,1);

%define variables for no iterations
itr = 0;
er_apx = 100;

%%Use Eulers Method:
%Predictor
for k = 1:sz-1
    %calculate the new step size that will be used
    new_h = t(k+1) - t(k);
    %feval is used to evaluate a specific function handle being called
    eval_1 = feval(dydt,t(k),y(k));
    y(k+1) = y(k)+eval_1*h;
    
    %no iterations
    itr = 0;
    er_apx = 100;
    
%%Corrector
%use a while loop to determine if the maximum iterations and error
%   criteria is met 
    while er_apx >= es && itr <= maxit
        old = y(k+1);
        eval_2 = feval(dydt,t(k)+new_h,y(k+1));
        y(k+1) = y(k)+h*(eval_1+eval_2)/2;
        
        %Use iterations
        itr = itr+1;
        %Calculate the approximate error with iterations
        if y(k+1) ~= 0
            er_apx = abs((y(k+1)-old)/y(k+1))*100;
        end
        end
end
    
%Plot the solution
plot(t,y,"m");
%Label axes
xlabel('t');
ylabel('y');
title('Differential Equation Solution')
end