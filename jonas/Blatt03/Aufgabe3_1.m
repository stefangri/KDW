format long

function K = Koeff(X, F)
L = length(X);
  if L == 1
    K = F(1)
  else 
    K = 1/(X(L) - X(1)) * (Koeff(X(2:L),F(2:L)) -  Koeff(X(1:L-1),F(1:L-1)))
  end
end

function [c] = myNewtonInterpol(x,f)
l = length(x);
a = 0, for b = 1:l
 c(b) = Koeff(x(1:b), f(1:b));
 end
end

x = [0, 1/12, 1/6]
y = [0, 1/4 + sqrt(2)*10/4, 6]

myNewtonInterpol(x(1:3), y(1:3))