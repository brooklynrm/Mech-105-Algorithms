clear
clc
%%Homework 10
%Written by: Brooklyn Murphy
%Written on: 09/26/2018

%Determine the value of x that satisfies the equation that determines used
%   to describe the process of water vapor being heated at high temperatures

%Define all constant variables in the equation
x0 = 0;
pt = 3;
K = .05;

%Randomly call the function that determines the value of x
%Subtract K onto other side
fxn = @(x)(x/(1-x))*sqrt((2*pt)/(2+x))-K;
%Find the root of the function using a built in MATLAB funtion
x = fzero(fxn,x0);

%Display the final value of x that satisfies the equation for water vapor
%   being heated at high temperatures
fprintf('The value of x (the mole fraction of H20 that dissociates) is %3f\n',x);
