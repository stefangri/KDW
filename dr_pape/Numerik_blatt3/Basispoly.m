 function p = Interpol(x_j,y_j, x)
  
  N = 1;
  p = y_j(1); # erster Summand der Newton Interpolation
  
  for j = 2:length(x_j)
  
   N *= (x - x_j(j)); # Newton Basispolynome
   p += N * myNewtonInterpol(x_j, y_j)(j);
  end
  
 end