function y=f(a, x)


  for i = 1:length(x)

  y(i) = a(1) + a(2) * sin(x(i))  + a(3) * sin(2*x(i));
  end

  y = transpose(y)
end


### funktion definieren f = @(x) x.**3