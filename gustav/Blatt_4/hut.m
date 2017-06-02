%BERECHNUNG DER HUTFUNKTIONEN
function [phi] = hut(x_stuetz, x)

%HILFLISTE UM SONDERBEHANDLUNG VON 1. UND LETZTER STUETZSTELLE ZU BEACHTEN
  x_stuetz_h = [0 x_stuetz 1];


  for i = 2:1:length(x_stuetz_h) - 1

    if x >= x_stuetz_h(i - 1) && x <= x_stuetz_h(i) %WENN x IM INTERVALL I_i
      phi(i - 1) = (x - x_stuetz_h(i - 1))/(x_stuetz_h(i) - x_stuetz_h(i - 1));

    else if x >= x_stuetz_h(i) && x <= x_stuetz_h(i + 1) %WENN x IM INTERVALL I_(i+1)
      phi(i - 1) = (x_stuetz_h(i + 1) - x)/(x_stuetz_h(i + 1) - x_stuetz_h(i));

    else
      phi(i - 1) = 0;

    end

  end


end
