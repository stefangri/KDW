for n = [7, 12, 17]
  i = 0:1:n;
  x_aequidistant = -1 + 2*i / n;
  x_tschebyscheff = cos((2 * i + 1 )*pi / (2 * n + 2));
  x_plot = -1:0.01:1;

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
  legend('Exakt','Aequidistante Stuetzstellen', 'Interpolation','Tschebyscheff Stuetzstellen', 'Interpolation')



  title(['Interpolation mit N = ' num2str(n)]);
  xlabel('x');
  ylabel('y');
  print(['plots/PA2-1-N' num2str(n) '.pdf']);
end
