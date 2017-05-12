function p = myNewtonInterpol(x,f)
  N_k = sum(zeros(length(x)));
  n = length(x);
  for l = 1:n
    for k = 1:(n - l)
    N_k(l) = (N_k(k + l) - N_k(k + l -1)) / (x(k + l) - x(k));
    end
  end
  
  p = sum(zeros(length(x)));
  
  for i = 1:n
    p(i) = N_k(i) * f(i);
  end
 end 