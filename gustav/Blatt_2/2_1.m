format long
exponent = -7

%"exakter" Wert mit matlab Funktion
exact = exp(exponent)

for iter = 5:5:35 #Approximation für 5, 10, .., 35 Schritte
  iter

  %Rechenweg a, direktes Einsetzen des Exponenten
  version_a = approx_exp(exponent, iter)
  rel_err_a = abs((version_a - exact) / exact)

  %Rechenweg b, Approximation Kehrwert dann hoch -1
  version_b = 1/approx_exp(-exponent, iter)
  rel_err_b = abs((version_b - exact) / exact)

  %Rechenweg c, 1 * sign(exponent) Einsetzen dann hoch abs(exponent)
  version_c = approx_exp(-1, iter)**-exponent
  rel_err_c = abs((version_c - exact) / exact)
  printf('\n')
end
