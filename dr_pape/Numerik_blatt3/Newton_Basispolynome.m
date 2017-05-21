function N_k = Newton_Basispolynome(x, x_wert, y_wert)
  
  N_k = 1;
  buffer = sum(ones(length(x_wert)));
  
 for j = 2:length(x_wert)
  k = myNewtonInterpol(x_wert, y_wert)
  buffer(j) = (x - x_wert(j)) * k(j);
  
 end
 
 for i = 1:length(x_wert)
 
  N_k *= buffer(i)
  
 end
 
end