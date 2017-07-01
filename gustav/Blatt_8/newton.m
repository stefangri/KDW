function [y] = newton(f, df, x_0, n)
  y(1) = x_0;
  for i = [2:1:n]
    y(i) = y(i - 1) - (f(y(i - 1)))/(df(y(i - 1)));
  end
end
