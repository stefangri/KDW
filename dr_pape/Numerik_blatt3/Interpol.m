 function p = Interpol(x_j, c, x)
  
  N = 1;
  p = 0; # erster Summand der Newton Interpolation
  
  for j = 1:length(x_j)
  
   p += N * c(j);
   N *= (x - x_j(j)); # Newton Basispolynome
   
  end
  
 end