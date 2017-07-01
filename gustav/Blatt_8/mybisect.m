function [x, e, v] = mybisect(f, a, b)
x(1) = 0.5 * (a + b);
v(1) = x(1);
e(1) = 0;
for i = [2:1:9999]
  if (f(a) * f(x(i - 1))  <  0)
    b = x(i - 1);
  end
  if (f(b) * f(x(i-1)) < 0)
    a = x(i - 1);
  end

  x(i) = 0.5 * (a + b);
  e(i) = abs(x(i) - x(i - 1));

  if (e(i) < 10^(-12))
    break;
  end

  v(i) = f(x(i));
end
end
