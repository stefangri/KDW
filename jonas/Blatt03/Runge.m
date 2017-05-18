function R = Runge(x) 
  for i = 1:length(x)
  R(i) = (1 + 25 * x(i).^2).^(-1);
  end
end