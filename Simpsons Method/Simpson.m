function I = Simpson(x,y)
%Written by: Brooklyn Murphy
%Written on: 11/04/2018

%%This function is used for integrating experimental data using the (Composite)
%   Simpson's 1/3 Rule.

%Inputs:
%   x = independent variable from the data vector inputed
%   y = dependent variable from the data vector inputed
%Outputs: 
%   I = integral of the vector function 

%Ask user to input a vector of function values 'y' with respect to 'x'

%Check all of the dimensions inputed
n = length(x);
m = length(y);

%Make sure all of the matrix dimensions agree in order to correctly complete the
%   Simpson's 1/3 and Trapezoidal rule
if n~=m
    error('Please create x and y vectors in which the dimensions agree')
end

%diff finds the differences between elements along the vector's dimensions
%   *must be greater than one to calculate
dif = diff(x);

%Make sure the that intervals of the elements are equal before integrating
if min(dif) ~= max(dif)
    error('The intervals you inputed are not equal -- please check the spacing')
end
%check to see if even or odd (ie mod(10,3)=1) 
remainder = mod(n,2); 

if remainder == 0
    %Warn the user that the trapezoidal rule will be used for the last
    %   step to find the interval 
    warning('The trapezoid rule will be used for the last iteration')
    c = n-1;
else
end
%Calculate the step size (h) to be used in the integration techniques
h = abs((x(1) - x(end)))/n;
%Use (composite) simpson's 1/3 rule to calculate the integral if even number 
%   of intervals *first and last aren't multiplied by a number
I = (y(1) + y(end) + sum(4*y(2:2:c-1)) + sum(2*y(3:2:c-2))) *h/3;

%An odd number of intervals means you must use the trapezoidal rule
if remainder == 0
    %Use the tapezoidal rule to calculate the integral if odd number of
    %   intervals
    I = I + ((y(n-1) + y(n))/2)*h;
end
end
