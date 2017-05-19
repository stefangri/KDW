function p = myNewtonInterpol(x, y)
  p = sum(zeros(length(x)));
  n = length(x);
  for l = 1:n
    for k = 1:(n - l)
    p(l) = (y(k + l) - y(k + l -1)) / (x(k + l) - x(k)) % dividierte Differenzen
    end
  end
 end