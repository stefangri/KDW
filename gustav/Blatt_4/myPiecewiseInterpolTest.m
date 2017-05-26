n = 2.^[1:1:7];

for i = n
  if i > 100
    m = 150;
  else
    m = 100;
  end

  x_i = -1 + 2  .* [1:1:i] ./ i;
  delta = -1 + 2 .*[1:1:m]./m;

  fig = figure('visible', 'off');
  plot(delta, exp(delta), 'g-');
  hold on;
  y_piece = myPiecewiseInterpol(x_i, exp(x_i), delta);
  plot(delta, y_piece, 'r-')
  if i <= 16

    y_poly = newtonPoly(x_i, exp(x_i), delta);
    i
    max_err_piece = max(abs( exp(delta) - y_piece ))
    max_err_poly  = max(abs( exp(delta) - y_poly ))
    plot(delta, y_poly, 'b-');
    legend ('Exakt','Stueckweise Interpolation', 'Polynominterpolation', 'location', 'northeastoutside');
  else
    i
    max_err_piece = max(abs( exp(delta) - y_piece ))
    legend ('Exakt','Stueckweise Interpolation', 'location', 'northeastoutside');
  end

  title(['Interpolation mit N = ' num2str(i)]);
  xlabel('x');
  ylabel('y');
  print(['plots/PA4-1-N' num2str(i) '.pdf']);


end
