function [y] = newtonPoly(x_n, f, x_plot)
  %setzt Koeffizienten und Newtonbasispolynome zusammen 
  a = myNewtonInterpol(x_n, f);
  y = zeros(1, length(x_plot));
  for i = 1:1:length(x_n)
    y = y +  a(i) * newtonBase(x_plot, x_n(1 : i));
  end
end
