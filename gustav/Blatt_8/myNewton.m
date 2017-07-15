function [x, e, v] = myNewton(f, df, x_0)
  x(1) = x_0;
  e(1) = 0;
  v(1) =  f(x_0);

  %MAXIMAL 50 SCHRITTE
  for i = [2:1:50]

    x(i) = x(i - 1) - (f(x(i - 1)))/(df(x(i - 1)));
    e(i) = abs(x(i) - x(i-1));

    %ABBRUCHBEDINGUNG
    if (e(i) < 10^(-12))
      break;
    end

  v(i) = f(x(i));
  end

end
