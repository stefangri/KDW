function [K] = Koeff(x,y)
  for i = 1:(length(x)-1)
    K(i) = (y(i+1) - y(i))/(x(i+1) - x(i));
  end
end