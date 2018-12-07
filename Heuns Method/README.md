# Heuns Method
### Description: 
This function is used to find the numerical solution to a differential equation 'dydt'.

##### *Inputs:*

>1. dydt - differential function

>2. tspan - span/length of the differential function

>3. y0 - initial condition

>4. h - step size being used

##### *Optional inputs: only for iterations involving the predictor-corrector*

>1. es - stopping criterion (default to .001)

>2. maxit - maximum number of iterations (default to 50)

##### *Outputs:*

>1. t - resulting value of the variable "t" in the differential equation

>2. y - resulting value of the variable "y" in the differential equation

#### Limitations:
This function is only accurate for ordinary differential equations (ODEs).
