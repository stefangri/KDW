n = 2.^[1:1:7];

%UNTERSUCHUNG DER INTERPOLATION DER EXPONENTISLFUNKTION
for i = n

%PLOTPUNKTE FEINER WÄHLEN ALS STÜTZSTELLEN
  if i > 100
    m = 150;
  else
    m = 100;
  end

%STUETSTELLEN UND PLOTPUNKTE
  x_i = -1 + 2  .* [1:1:i] ./ i;
  delta = -1 + 2 .*[1:1:m]./m;


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
  else
    i
    max_err_piece = max(abs( exp(delta) - y_piece ))
    legend ('Exakt','Stueckweise Interpolation', 'location', 'northeastoutside');
  end

  title(['Interpolation der Exponentialfunktion mit N = ' num2str(i)]);
  xlabel('x');
  ylabel('y');
  print(['plots/PA4-1-exp-N' num2str(i) '.pdf']);


end


n = 2.^[1:1:7];
%UNTERSUCHUNG DER INTERPOLATION DER RUNGEFUNKTION
for i = n

  fig = figure('visible', 'off');
  plot(delta, runge(delta), 'g-');
  hold on;

  y_piece = myPiecewiseInterpol(x_i, runge(x_i), delta);
  plot(delta, y_piece, 'r-')

  if i <= 16

    y_poly = newtonPoly(x_i, runge(x_i), delta);
    i
    max_err_piece = max(abs( runge(delta) - y_piece ))
    max_err_poly  = max(abs( runge(delta) - y_poly ))
    plot(delta, y_poly, 'b-');
    legend ('Exakt','Stueckweise Interpolation', 'Polynominterpolation', 'location', 'northeastoutside');
  else
    i
    print('runge')
    max_err_piece = max(abs( runge(delta) - y_piece ))
    legend ('Exakt','Stueckweise Interpolation', 'location', 'northeastoutside');
  end

  title(['Interpolation der Rungefunktion mit N = ' num2str(i)]);
  xlabel('x');
  ylabel('y');
  print(['plots/PA4-1-runge-N' num2str(i) '.pdf']);



end
