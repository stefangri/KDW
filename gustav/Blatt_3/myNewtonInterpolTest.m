for n = [7, 12, 17]
  %Stützstellen definieren
  i = 0:1:n;
  x_aequidistant = -1 + 2*i / n;
  x_tschebyscheff = cos((2 * i + 1 )*pi / (2 * n + 2));
  x_plot = -1:0.005:1;

  %Plots
  fig = figure('visible', 'off');
  y_exact = runge(x_plot);
  plot(x_plot, runge(x_plot), 'g-' );
  hold on;
  plot(x_aequidistant, runge(x_aequidistant), 'r*');
  y_aequidistant = newtonPoly(x_aequidistant, runge(x_aequidistant), x_plot);
  plot(x_plot, y_aequidistant, 'r-');

  plot(x_tschebyscheff, runge(x_tschebyscheff), 'b*')
  y_tschebyscheff = newtonPoly(x_tschebyscheff, runge(x_tschebyscheff), x_plot);
  plot(x_plot, y_tschebyscheff, 'b-');
  legend ('Exakt','Aequidistante Stuetzstellen', 'Interpolation','Tschebyscheff Stuetzstellen', 'Interpolation', 'location', 'northeastoutside');


  title(['Interpolation mit N = ' num2str(n)]);
  xlabel('x');
  ylabel('y');
  print(['PA2-1-N' num2str(n) '.fig']);

  
  %Maximale Abstände
  m = 100;
  j = 0:1:m;
  delta = -1 + 2*j/m;
  n
  max_aequi = max(abs(runge(delta) - newtonPoly(x_aequidistant, runge(x_aequidistant), delta)))
  max_tsch  = max(abs(runge(delta) - newtonPoly(x_tschebyscheff, runge(x_tschebyscheff), delta)))
end

%Beobachtung: Für steigende Zahl der Iterationen wird der maximale Fehler für die
%Berechnung mit den äquidistanten Fehlern immer größer. Die Tschebyscheffstützstellen
%sind so konstruiert, dass sie am Rand des Intervalls dichter liegen. Daher eignen sie
%offenbar besser für die Polynominterpolation. Hier werden die Fehler mit N kleiner.
