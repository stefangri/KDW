function y = horner(x, coeff)

  %innerste Klammer
  y = coeff(1) .*x + coeff(2);

  %horner schema
  for i = coeff(3 : end)
    y = y .*x + i;
  end

end
