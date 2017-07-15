function y = myFixpunktIter(g, x_0, N)

  y(1) = x_0;
  d(1) = 0;
  for i = [2: N]
    y(i) = g(y(i - 1));
    d = abs(y(i) - y(i - 1))
  end

end
