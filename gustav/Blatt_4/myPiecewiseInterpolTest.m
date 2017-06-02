%PROGRAMMIERAUFGABE 4

n = 2.^[1:1:7]; % N = 2, 4, 8...

%UNTERSUCHUNG DER INTERPOLATION DER EXPONENTIALFUNKTION
for i = n

%PLOTPUNKTE FEINER WÄHLEN ALS STÜTZSTELLEN
  if i > 100
    m = 150;
  else
    m = 100;
  end

%STUETSTELLEN UND PLOTPUNKTE
  x_i = -1 + 2  .* [0:1:i] ./ i;
  delta = -1 + 2 .*[0:1:m]./m;


%PLOT
  fig = figure('visible', 'off');

  %EXAKT
  plot(delta, exp(delta), 'g-');
  hold on;

  %FUNKTIONSWERTE DER STUECKWEISEN INTERPOLATION
  y_piece = myPiecewiseInterpol(x_i, exp(x_i), delta);
  plot(delta, y_piece, 'r-')

  %PLOT MIT POLYNOMINTERPOLATION NUR FÜR N <= 16
  if i <= 16
    y_poly = newtonPoly(x_i, exp(x_i), delta);
    i
    %MAXIMALE FEHLER
    max_err_piece = max(abs( exp(delta) - y_piece ))
    max_err_poly  = max(abs( exp(delta) - y_poly ))
    plot(delta, y_poly, 'b-');
    legend ('Exakt','Stueckweise Interpolation', 'Polynominterpolation', 'location', 'northeastoutside');
  else %FÜR N > 16 NUR NOCH BETRACHTUNG DER STUECKWEISEN INTERPOLATION
    i
    max_err_piece = max(abs( exp(delta) - y_piece ))
    legend ('Exakt','Stueckweise Interpolation', 'location', 'northeastoutside');
  end

  title(['Interpolation der Exponentialfunktion mit N = ' num2str(i)]);
  xlabel('x');
  ylabel('y');
  print(['plots/PA4-1-exp-N' num2str(i) '.fig']);


end




%UNTERSUCHUNG DER INTERPOLATION DER RUNGEFUNKTION
for i = n;

%PLOTPUNKTE FEINER WÄHLEN ALS STÜTZSTELLEN
  if i > 100
    m = 150;
  else
    m = 100;

  end

  x_i = -1 + 2  .* [0:1:i] ./ i; %Stuetzstellen
  delta = -1 + 2 .*[0:1:m]./m; %Plotpunkte

  fig = figure('visible', 'off');
  plot(delta, runge(delta), 'g-');
  hold on;

  y_piece = myPiecewiseInterpol(x_i, runge(x_i), delta);
  plot(delta, y_piece, 'r-')

  if i <= 16

    y_poly = newtonPoly(x_i, runge(x_i), delta); %FUNKTIONSWERTE DER POLYNOMINTERPOLATION
    i
    max_err_piece = max(abs( runge(delta) - y_piece )) %MAXIMALER FEHLER STUECKWEISE
    max_err_poly  = max(abs( runge(delta) - y_poly )) %MAXIMALER FEHLER POLYNOM
    plot(delta, y_poly, 'b-');
    legend ('Exakt','Stueckweise Interpolation', 'Polynominterpolation', 'location', 'northeastoutside');
  else
    i
    max_err_piece = max(abs( runge(delta) - y_piece ))
    legend ('Exakt','Stueckweise Interpolation', 'location', 'northeastoutside');
  end

  title(['Interpolation der Rungefunktion mit N = ' num2str(i)]);
  xlabel('x');
  ylabel('y');
  print(['PA4-1-runge-N' num2str(i) '.fig']);

end


%KOMMENTAR ZU DEN ERGEBNISSEN:
%DIE EXPONENTIALFUNKTION WIRD BESSER DURCH DIE POLYNOMINTERPOLATION
%APPROXIMIERT ALS DURCH DIE STUECKWEISE INTERPOLATION. DIE LIEGT DARAN, DASS DIE EXPONENTIALFUNKTION
%ÜBER EINE POTENZREIHE DEFINIERT IST UND SOMIT GUT ÜBER EIN POLYNOM MIT HOHEM EXPONENTEN DARSTELLBAR IST.

%DIE RUNGEFUNKTION WIRD WESENTLICH BESSER DURCH DIE STUECKWEISE INTERPOLATION ANGENÄHERT. DIES LIEGT DARAN, DASS
%DIE POLYNOMINTERPOLATION SCHLECHTE APPROXIMATION FÜR UNMONOTONE FUNKTIONEN LIEFERT. WEITER TEILT DIE RUNGE FUNKTIONEN
%KEINE EIGENSCHAFTEN MIT EINER POTENZFUNKTION UND DIE STUETZSTELLEN WURDEN AEQUIDISTANT GEWÄHLT.
