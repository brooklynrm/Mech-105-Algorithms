%%Created by: Brooklyn Murphy
%Created on: 09/11/2018
%Homework 7 Problem 2

clear
clc

%Determine the smallest positive number used in MATLAB

%x=the smallest positive number in MATLAB
x=1;
%While a number is greater than zero (starting from 1), continually divide 
%   it by 2 so it gets smaller and smaller until the number is so small 
%   that MATLAB must display it as zero.
while x>0
    x=x/2;
end
