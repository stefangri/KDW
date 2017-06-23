%Funktion f
%w entält Gewichte bezogen auf Einheitsintervall
%p enthält Stützstellen auf Einheitsintervall
%a, b Integrationsgrenzen
%N Array mit Anzahl der Teilintervalle
function [v] = myQuadraturSum1D(f, w, p, a, b, N)
  %FÜR ALLE N WIRD QUADRATUR BERECHNET
  for i = [1:1:length(N)]
    % ÜBERGEBEN WERDEN DIE FUNKTION F, DIE ANGEPASSTEN STÜTZSTELLEN UND GEWICHTE,
    %START UND ENDPUNKT, SOWIE EIN ARRAY MIT EINTRÄGEN 1, 2, 3, ... i
    v(i) = sum(myQuadratur1D(f, (b - a) / i  .*  w, (b - a) / i .* p, a, b, N(1:i)));
  end
end
