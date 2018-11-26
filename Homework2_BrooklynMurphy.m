clear
clc
%%Homework 2
%Written by: Brooklyn Murphy 
%Written on: 8/26/2018

%Concentration vs. Time for Photodegredation of Aqueous Bromine

%t=time (minutes)
t=[10:10:60];
%c=concentration (ppm)
c=[3.4,2.6,1.6,1.3,1,0.5];
%T=time (minutes)
T=linspace(0,70);
%Function of Concentration vs. Time
cT=4.84*exp(-.034*T);

%Plot both the data (using red diamond shaped) and the function (using a
    %green dashed line)
plot(T,cT,'--g',t,c,'dr')

%Label the x and y axis and the title
title('Phtodegredation of Aqueous Bromine')
xlabel('time(min)')
ylabel('Concentration(ppm)')