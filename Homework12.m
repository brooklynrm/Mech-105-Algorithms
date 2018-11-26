%%Written by: Brooklyn Murphy
%Written on: 10/02/2018

%Homework 12 - McGraw Hill: graphing

clear
clc

%Define the values for the x-axis
xaxis = -500:500;
%Define the given function
fx = (-1.5*xaxis.^6)-(2*xaxis.^4)+(12*xaxis);

%Plot the function given (x,y)
plot(xaxis,fx,'m')
