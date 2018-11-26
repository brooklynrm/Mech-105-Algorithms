clear
clc
%%Homework 3 - Water Volume
% Created by: Brooklyn Murphy
% Created on: 8/28/2018

% Determine the volume of water in a tank from the position (height in
    % meters) of the float

%Ask the user to enter in a specific height of the water to substitute
    %as the variable h in the volume equations
h=input('Enter the height of the float:');

%There are two shapes in the tank - an inverted frustum of a cone and a
    %cylinder, which are both used to determine total volume.
%Due to the variance in shape, there are three scenarios for the height of
    %the water... Between 0 and 19m or 19 and 33m. This is important because
    %the volumes for a cone vs. a cylinder will be different.

if h>=0 && h<=19
%Find the volume of water in a cylinder at the bottom of the tank
    cyl_vol=pi*(12.5^2)*h;
    disp(cyl_vol)
elseif h>=19 && h<=33
%Find the volume of water in a Cone + the volume of the cylinder at the
    %bottom of the tank
    tot_vol=((1/3)*pi*(23^2)*(h-19))+(pi*(12.5^2)*19);
    disp(tot_vol)
else
    disp('Idiot!! This input is not logical - enter in a number between 19 and 33m.')
end