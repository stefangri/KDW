function N_k = Newton_Basispolynom(x, x_wert)
  for j = 1:length(x_wert)
  
  if j > 2
  
  N_k(j) = N_k(j - 1) * (x - x_wert(j));
  
  end
  
  end
 end 