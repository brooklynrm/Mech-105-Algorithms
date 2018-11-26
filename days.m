function nd = days(mo,da,leap)
%This function determines the elapsed days in a year
%Output(s): elapsed days
%Input(s): month, day, leap
%Define Variables:
%   mo = the month (0-12)
%   da = the day (1-31)
%   leap = (0 for non-leap year and 1 for leap year)

%Assign each month the correct amount of total days
DaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];
%i correlates to a specific value from the variable, DaysInMonth
i=1;
nd=0;

%While the variable, i, is less than the value for "month" (between 1 and
%   12), add the corresponding amount of days in each month together -- from
%   DaysInMonth
while i < mo
    nd=nd+DaysInMonth(i);
    i=i+1;
end
%After finding nd, add the remaining number of days from the input value to
%   find the total elapsed days
nd=nd+da;
%Every four years in February is a leap year, which means there is one less
%   total day elapsed
%Determine if it is a leap year by either adding 0 or 1 (leap) to the previous 
%   nd value 
if mo>=2 
    nd=nd+leap;
end

