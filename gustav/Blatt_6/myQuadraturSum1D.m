%Funktion f
%w entält Gewichte
%p enthält stützstellen auf Einheitsintervall
%a, b Integrationsgrenzen
%N Anzahl der Teilintervalle
function [v] = myQuadraturSum1D(f, w, p, a, b, N)
  %für alle n wird die quadratur berechnet
  for i = N
    v(i) = sum(myQuadratur1D(f, (b - a) / i  .*  w, (b - a) / i .* p, a, b, N(1:i)));
end
end
