### Skript zum Newton-Verfahren ###

function [x, e, v] = myNewton(f, df, x0)

  if f(x0) == 0;
    printf('Startwert ist schon eine Nullstelle.')
    x = x0;
    e = 0;
    v = f(x0);
    break
  end
  
  x(1) = x0;
  x(2) = x(1) - f(x(1)) / df(x(1));
  v(1) = f(x(1));
  e(1) = abs(x(1) - x(2));
  
  n = 2;
  
  while(abs(x(n) - x(n-1)) > 10**(-12))
    
    v(n) = f(x(n));
    e(n - 1) = abs(x(n) - x(n - 1));  
    x(n + 1) = x(n) - f(x(n)) / df(x(n));
  
    n += 1;
  
    if n == 50
      printf('n > 50. Abbruch des Verfahrens.')
      break
    end
  
  end

end