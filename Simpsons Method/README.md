# Simpson's Method
This function integrates experimental data using Simpson’s 1/3 rule. It is able to do so by checking if there are an odd number of intervals. If so, the trapezoidal rule is used for the last interval. The function inputed should numerically evaluate the integral of the vector of function values ‘y’ with respect to ‘x’.

Limitations include: 

>This function will not work correctly if the intervals are unequally spaced.

• Error check that the inputs are the same length
• Error check that the x input is equally spaced
• Warn the user (not an error, just a warning) if the trapezoidal rule has to
be used on the last interval.
