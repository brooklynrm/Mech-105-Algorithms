function [Mat] = ElementMatrix(n,m)
%%Created by: Brooklyn Murphy
%Created on: 9/09/2018

%%This function is used to return an n x m matrix with elements in which
%   the value of each element in the first row is the number of the column,
%   the value of each element in the first column is the number of the row, 
%   and the other elements have values equal to the sum of the elements 
%   above and to the left of them.

%%Inputs:
%n=number of rows
%m=numeber of columns

%Outputs:
%Mat=element matrix 

%ask user for the essential inputs to create a matrix using those values
n=input('input total number of rows:');
m=input('input total number of columns:');

%If user enters in three values, display an error message
if nargin > 2 
    disp('ONLY ENTER IN 2 VALUES!')
end

%For row number one, the value of each element should increase by one from
%   left to right
for x=1:n
    %For column number one, the value of each element should increase by 
    %   one from top to bottom
     for y=1:m
         if x==1
             Mat(x,y)=y;
         elseif y==1
             Mat(x,y)=x;
         else
             %If x or y does not indicate that it is referring to the first 
             %  row or column, the value of each element should be the sum 
             %  of the number above and to the left of it
             Mat(x,y)= Mat(x,y-1)+Mat(x-1,y);
         end
     end
end
end
                
            