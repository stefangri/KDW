function y = horner(x, coeff)

  %erster Term
  y = coeff(1);

  %horner schema
  for i = coeff(2 : end)
    y = y .*x + i;
  end
end
