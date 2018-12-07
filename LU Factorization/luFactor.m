function [L,U,P,inverse] = luFactor(A)
%%Created by: Brooklyn Murphy
%Created on: 10/19/2017

%%This function is used to determine the LU factorization of a square matrix 
%Inputs:
    %A = coefficient matrix
%Outputs:
    %L = lower triangular matrix (zeros in the upper corner triangle)
    %U = upper triangular matrix (zeros in teh lower corner triangle)
    %P = the pivot matrix

if nargin > 1
%Check to see if the input from the user is only one coefficient matrix, if
%   it's not, display an error
    error('You have too many inputs -- Please enter in only ONE input as a square matrix')
end

%m = number of rows, n = number of columns found using the built in
%   funciton "size"
[m,n] = size(A);
%If n and m, the number of rows and columns do not agree, display an error
%   message because one equation eliminate in the coefficient matrix must
%   be deleted, as the variables and number of equations don't agree 
if n ~= m
    error('Your input is not a square matrix because the number of rows and columns do not agree. The number of variables and equations must be the same, so plese enter in a matrix with the same number of rows and columns')
end
%L and U are used to display the outcome of this decomposition using a
%   Lower and Upper triangular matrix
%eye = built in identity matrix in matlab
L = eye(n);
U = A;
P = L;
%P is the permutation matrix used to track the rows and columns as they
%   pivot

%Look at all rows and determine which coefficient absolute value is largest
for c = 1:n-1
%Evaluate the first column and determine which absolute value is the
%   greatest, to see if pivoting is necessary -- the largest value in the
%   first column should be in the first row
    col_1 = A(c:n,c); 
    big_num = abs(col_1);
%prow = pivot row that will replace the first row because it contains the greatest value in
%   the column
%~ omits the actual maximum value in the column and allows the pivot row to
%   be the only thing taken into account
    [~, p_row] = max(big_num);
    p_row = p_row+(c-1);
if p_row ~= c 
%Replace rows p_row and c with each other in U to pivot correctly
    
%Create a new matrix by pivoting the elements found above
%Evaluate the changing matrix with "U"
    new_mat = U(c,:);
    U(c,:) = U(p_row,:);
    U(p_row,:) = new_mat;

%Evaluate the changing matrix with "P"
    new_mat = P(c,:);
    P(c,:) = P(p_row,:);
    P(p_row,:) = new_mat;
end

%After the pivoting is completed, find the solution to this function
%   through the Gauss Elimination Method to eliminate values in the matrix
%   to create lower and upper triangular matrices

    L1 = U(c+1:n,c)/U(c,c); %Find element to divide by
    L(c+1:n,c) = L1; %Lower triangular matrix
    U(c+1:n,:) = U(c+1:n,:)-(L1*(U(c,:))); %Upper triangular matrix
if c >= 2
%Evaluate the changing matrix with "L"
    new_mat = L(c,1:c-1);
    L(c,1:c-1) = L(p_row,1:c-1);
    L(p_row,1:c-1) = new_mat; 
end
end

%%Extra Credit
%Find the inverse of Matrix A
inverse = zeros(n);
%Identify the inverse matrix with zeros to fill in later with 
identity = eye(n);
%Identify the inverse matrix with the built in Matlab function (eye) so you 
%   can move through each column to find d1, d2, and d3which will allow for pivoting
d = zeros(n);
%Solve d by inserting zeros into the matrix to fill after using L\I = d and
%   U\d = x

for k = 1:n
    %Find the value for d using L\I = d
    d(:,k) = L\identity(:,k);
    %Plug in the value of d to solve for the inverse matrix of A
    inverse(:,k) = U\d(:,k);
end
%Pivot the inverse matrix by multiplying it by matrix P 
    inverse = inverse*P;
end
