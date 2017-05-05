format long

function y = approx_exp(x, k)
  if k == 0
    y = 1;
  else
    y = x**k / factorial(k) + approx_exp(x, k - 1);
  y
end


k = 1
x = k
approx_exp(1, 5)
