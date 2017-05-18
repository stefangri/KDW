function [c] = myNewtonInterpol(x,f)
l = length(x);
for b = 1:l
 c(b) = Koeff(x(1:b), f(1:b));
end
