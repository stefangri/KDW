### Skript zur Bisektion ###

function [x, e, v] = mybisect(f, a, b)

  x(1) = 1 / 2 * (a + b);
  v(1) = f(1);
  if f(x) == 0
    a = x(1);
    b = x(1);
    e = 0;
  elseif f(x(1)) * f(a) < 0
    b = x(1);
  elseif f(x(1)) * f(b) < 0
    a = x(1);
  end
  x(2) = 1 / 2 * (a + b);
  
  e(1) = abs(x(2) - x(1));
  n = 2;
  
  while(abs(x(n) - x(n - 1)) > 10**(-12))
  
    v(n) = f(x(n));
    e(n) = abs(x(n) - x(n - 1));
    
    if f(x(n)) == 0
      a = x(n);
      b = x(n);
    elseif f(x(n)) * f(a) < 0
      b = x(n);
    elseif f(x(n)) * f(b) < 0
      a = x(n);
    end
    
    n += 1;
    x(n) = 1 / 2 * (a + b);
    
    if n == 9999
      printf('n > 9999, Abbruch!')
     break
    end
    
  end
 
  
end