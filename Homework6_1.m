%%Created by: Brooklyn Murphy
%Created on: 09/11/2018

%Create an algorithm that finds machine epsilon (the smallest number that
%when added to one gives a number greater than 1).

e=1;
%Create a while loops for e<=1 to find machine epsilon
while e<=1
    
    %if 1+e is less than or equal to 1, then go to step 5
    %otherwise go to step 3
    if e+1<=1
        break
    end
    
    %step 3 = e=e/2
    e=e/2;
end

%step 5 = e=2*e
ep=2*e;

    