function [N] = newtonBase(x, x_n)
  %Berechnet das n-te Newtonbasispolynom
  for j = (1:1:length(x))
    N(j) =   prod(x(j) - x_n(1 : end - 1));
  end
end
