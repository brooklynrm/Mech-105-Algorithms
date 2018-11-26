%%Created by: Brooklyn Murphy
%Created on: 09/13/2018
clear
clc
%Homework 8 - Taylor Series
%%Problem 1: Use zero through third-order Taylor Series Expansion to predict
%   f(3) for a function using a base point at x=1. Compute the true percent
%   relative error for each approximation.

%coefficients of original function, fx
fx = [25 6 7 -88];
%coefficients of first derivative of fx
first = [75 -12 7];
%coefficients of second derivative of fx
second = [150 -12];
%coefficients of third derivative of fx
third = [150];
dx=2;
%0th order of Taylor series using base point x=1 
order_0 = polyval(fx,1);
%1st order of Taylor series using base point x=1 
order_1 = order_0+(1/factorial(1)*polyval(first,1))*dx;
%2nd order of Taylor series using base point x=1 
order_2 = order_1+(1/factorial(2)*polyval(second,1))*dx;
%3rd order of Taylor series using base point x=1 
order_3 = order_2+(1/factorial(3)*polyval(third,1))*dx;

%true percent relative error of Taylor Series Approximations
er = polyval(fx,3);
%true percent relative error of 0th order
er_0 = abs((order_0-er)/er)*100;
%true percent relative error of 1st order
er_1 = abs((order_1-er)/er)*100;
%true percent relative error of 2nd order
er_2 = abs((order_2-er)/er)*100;
%true percent relative error of 3rd order
er_3 = abs((order_3-er)/er)*100;

%Display results
disp('The 0th through 3rd order Taylor Series Approximations for fx are:')
disp(order_0)
disp(order_1)
disp(order_2)
disp(order_3)

%Display errors
disp('The true percent (%) relative errors for each approximation are:')
disp(er_0)
disp(er_1)
disp(er_2)
disp(er_3)

%%Problem 2: Use forward, backward and centered difference approximations
%   to estimate the first derivative of the function in problem 1. Evaluate
%   the derivative at x=2 using a step size of h=.25.

fx = [25 -6 7 -88];
%Step size is h = .25
h = .25;

%Find the difference approximations with the derivative at x=2
%Forward difference approximation O(h)
fwd_appx = (polyval(fx,(2+h))-polyval(fx,2))/h;
%Backward difference approximation O(h)
back_appx = (polyval(fx,2)-polyval(fx,(2-h)))/h;
%Center difference approximation O(h^2)
cent_appx = (polyval(fx,(2+h))-polyval(fx,(2-h)))/(2*h);

%Display results
disp('The forward difference approximation is:')
disp(fwd_appx)
disp('The backward difference approximation is:')
disp(back_appx)
disp('The center difference approximation is:')
disp(cent_appx)