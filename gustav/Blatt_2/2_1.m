

format long
exponent = -7

%"exakter" Wert mit matlab Funktion
exact = exp(exponent)

for iter = 5:5:35 %Approximation für 5, 10, ..., 35 Schritte
  iter

  %Rechenweg a, direktes Einsetzen des Exponenten
  version_a = approx_exp(exponent, iter)
  rel_err_a = abs((version_a - exact) / exact) %relativer Fehler

  %Rechenweg b, Approximation Kehrwert dann hoch -1
  version_b = 1/approx_exp(-exponent, iter)
  rel_err_b = abs((version_b - exact) / exact)

  %Rechenweg c, 1 * sign(exponent) Einsetzen dann hoch abs(exponent)
  version_c = approx_exp(-1, iter)**-exponent
  rel_err_c = abs((version_c - exact) / exact)
  printf('\n')
end

%Kommentar zu den Ergebnissen:
%Die Verschiedenen Rechenwege liefern deutlich voneinander abweichende Ergebnisse.
%Bei der Rechnung nach c) tritt bereits für wenige Iterationen nur ein kleiner
%Fehler auf. Bei der Rechnung nach a) sind die Fehler sehr groß. Erst für viele
%Iterationen liefern alle Wege akzeptable Ergebnisse. Dies ist damit zu erklären,
%dass die Approximation eine Taylorreihe um 0 darstellt. Für kleine x (im Fall c)
%ist die Näherung besser als für große x (Fall b und c). Der Unterschied zwischen
%Weg a und und b entsteht durch das alternierende Vorzeichen der Reihenglieder
%beim Einsetzen von -7. Hier wird sich dem Grenzwert nicht von einer Seite genähert,
%was dazu führt, dass für wenige Iterationen eine große Differenz zum exakten Wert entstehen kann.
