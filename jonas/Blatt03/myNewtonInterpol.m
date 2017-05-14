[c] = myNewtonInterpol(x,F)

function K = Koeff(X, F)
L = length(X);
  if L == 1
    K = F(1);
  else 
    K = 1/(X(L) - X(1)) * (Koeff(X(2:L),F(2:L)) -  Koeff(X(1:L-1),F(1:L-1)))
  end
end

l = length(x);
for b = 1:l
 c(b) = Koeff(x(1:b), f(1:b));
end
