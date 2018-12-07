# False Position

### Description:
This function estimates the root of a given equation. 

###### *Inputs:*
>1. func - the function being evaluated

>2. xl - the lower guess

>3. xu - the upper guess

>4. es - the desired relative error (should default to 0.0001%)

>5. maxiter - the number of iterations desired (should default to 200)

###### *Outputs:*

>1. root - the estimated root location

>2. fx - the function evaluated at the root location

>3. ea - the approximate relative error (%)

>4. iter - how many iterations were performed

#### Limitations:
This function becomes less accurate when it approaches an inflection point
