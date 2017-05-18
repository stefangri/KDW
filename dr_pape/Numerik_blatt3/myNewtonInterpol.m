function p = myNewtonInterpol(x, f)
  p = sum(zeros(length(x)));
  n = length(x);
  for l = 1:n
    for k = 1:(n - l)
    p(l) = (p(k + l) - p(k + l -1)) / (x(k + l) - x(k)); % dividierten Differenzen
    end
  end      
 end 