function [y] = iter(f, x_0, n)
y(1) = x_0;

for i = [2: n]
  y(i) = f(y(i-1));
end

end
