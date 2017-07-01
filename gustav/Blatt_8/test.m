format long
%function y = f(x)
%  y = x.^4 - 4.*x.^2 + 4;
%end
%
%function y = df(x)
%  y = 4.*x.^3 - 8.*x ;
%end

%format long
%function y = g(x)
%  y = x.^4 - 5.*x.^2 + 6;
%end
%
%function y = dg(x)
%  y = 4.*x.^3 - 10.*x ;
%end

function y = f(x)
  y = cos(2*x)^2 - x^2;
end

function y = df(x)
  y = -4 * sin(2*x) * cos(2*x) -2*x;
end







f = @f;
df = @df;
%g = @g;
%dg = @dg;
%newton_f = newton(f, df, 1, 8);
%newton_g = newton(g, dg, 1, 8);
%newton_f - sqrt(2);
%newton_g - sqrt(2);


[x, e, v] = myNewton(f, df, 0.75);

[x_b, e_b, v_b] = mybisect(f, 0, 0.75);

fig = figure('visible', 'off');

  semilogy([1:1:length(v)], e(2:end), 'g-');
  hold on;
  semilogy([1:1:length(v_b)], e_b(2:end), 'b-');


  xlabel('n');
  ylabel('e');
  print(['PA8.3.pdf']);
