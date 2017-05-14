function R = Runge(x) 
  for i = 1:length(x)
  R(i) = (1 + 25 * x(i).^2).^(-1);
  end
  %R = (1 + 25 * x.^2).^(-1);
end