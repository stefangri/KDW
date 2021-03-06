%FUNKTION BERECHNET QUADRATUR FÜR JEDES TEILINTERVALL UND ÜBERGIBT ARRAY MIT ERGEBNISSEN
function [c] = myQuadratur1D(f, w, x, a, b, n)

  for i  = [1:1:length(x)]
    %IN JEDER ZEILE STEHEN DIE ANGEPASSTEN STÜTZSTELLEN FÜR DIE TEILINTERVALLE
    x_ANGEPASSTE_STUETZSTELLEN(:,i)= a + (n - 1).* (x(end) - x(1)) +  x(i);
  end
  %MULTIPLIKATION DER FUNKTIONSWERTE MIT DEN GEWICHTEN
  c = sum(f(x_ANGEPASSTE_STUETZSTELLEN) .* w);
end
