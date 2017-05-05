function y = approx_exp(x, k)
  if k == 0
    y = 1;
  else
    y = x**k / factorial(k) + approx_exp(x, k - 1);
  end
end
