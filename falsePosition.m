function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxit,varargin)
%%Created by: Brooklyn Murphy
%Created on: 09/23/2018

%This function is used to estimate the root of a given function. 
%Test this function by calling it randomly
%These are all strictly estimates of a function's roots, meaning that these
%   estimates will be infinitely close to zero but will never be exactly
%   zero

%Inputs:
    %func - the function being evaluated
    %xl - the lower guess
    %xu - the upper guess
    %es - the desired relative error (should default to 0.0001%)
    %maxiter - the number of iterations completed(should default to 200)
    %p1,p2...=additional parameters used by func

%Outputs:
    %root - the estimated root (intersection)
    %fx - the function evaluated at the root location
    %ea - the approximate relative error (%)
    %iter - how many iterations were performed
    
if nargin<3 %the number of inputs into this function should be a minimum of
%   three values -- the function, lower bound, and upper bound
    error('you need to input atleast 3 values')
end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0
    error('there is no sign change over this interval')%This is important
%   because a root is signified by a change in sign of the function, as 
%   crossing the x-axis results from a negative to positive value or vise
%   versa
end
if nargin<4 || isempty(es)
    es = .0001; %default value
end
if nargin<5 || isempty(maxit)
    maxit = 200; %default value
end
%test output values
iter = 0;
xr = xl;
ea = 100;
while(1) %test this function using a while loop with the above output values
    xrold = xr;
    xr_1 = double(func(xu))*(xl-xu);
    xr_2 = double (func(xl))-double(func(xu)); 
    xr = xu-(xr_1/xr_2); %This is an additional step that is not used in the
%   bisection method to find the roots of an equation, which makes this
%   method more efficient
    iter = iter+1; %total number of iterations used to find estimated roots of the function
    if xr ~= 0, ea = abs((xr-xrold)/xr)*100;
    end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test<0 %use this to check if the estimated root is negative, which 
%   becomes the new xl for the next iteration
        xu = xr;
    elseif test>0 %use this to check if the estimated root is positive, which
%   becomes the new xu for the next iteration
        xl = xr;
    else
        ea = 0;
    end
    if ea<=es || iter>=maxit
        break
    end
end
%final step to determine the estimated root
root = xr; fx= func(xr,varargin{:});
end

    
    
