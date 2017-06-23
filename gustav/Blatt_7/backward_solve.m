function x = backward_solve(LR, y)
n = length(y);
x(n) = y(n) / LR(n, n);
for j = [n:-1: 1]
  x(j) = (y(j) - sum(LR(j, j+1:n) .* x(j+1:n)))/LR(j, j);
end
x = transpose(x);
end
