
format long


function y = g(x)
  y = 1/6 * x**3 + 1/3 *x**2 + 1/6
end


myFixpunktIter(@g, 0, 6)
