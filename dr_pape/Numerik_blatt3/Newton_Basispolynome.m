function N_k = Newton_Basispolynome(x, x_wert)
  
  N_k = sum(ones(x_wert))
  
  for j = 1:length(x_wert)
  
  if j > 2
  
  N_k(j) = N_k(j -1) *(x(j) - x_wert(j));
  
  end
 end 