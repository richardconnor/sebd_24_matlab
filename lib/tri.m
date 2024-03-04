function res = tri(A,B)
%NB matlab interface for distance metric requires A is a row matrix of m dimensions and B
%is an nxm matrix, the result is a column matrix of the distances between A
%and each row of B

c = B - A; % c is an nxm array, each row of B has A subtracted for each element
c = c .* c; % c squared, might be faster than using an exponent...
e = c ./ (B + A); %again, e is an nxm matrix
%summing along the 2nd dimension, replace nan with zero in the case
% where component values of A and B are both zero
res = sqrt(sum(e,2,"omitnan")./2); 

end
