function K = Koeff(X, F)

L = length(X);
 if L == 1
   K = F(1);
 else 
   K = 1/(X(L) - X(1)) * (Koeff(X(2:L),F(2:L)) -  Koeff(X(1:L-1),F(1:L-1)));
 end
end