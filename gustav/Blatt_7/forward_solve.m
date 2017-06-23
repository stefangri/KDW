function y = forward_solve(LR, b)
n = length(b);
y(1) = b(1);
for j = [1:1:n]
  y(j) = b(j) - sum(LR(j, 1:j-1) .* y(1:j-1));
end
y = transpose(y);
end
