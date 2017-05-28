function [yEval]=myPiecewiseInterpol(x,f,xEval)
    
  for i = 1:(length(x) - 1)
  
    m(i) = (f(i) - f(i + 1)) / (x(i) - x(i + 1)); # Steigung der Geradegl. berechnen
    b(i) = (x(i) * f(i + 1) - x(i + 1) * f(i)) / (x(i) - x(i + 1)); # y-Achsenabschnitt der Geradegl. berechnen
  
  end
  
  for i = 1:(length(xEval))
    for j = 1:(length(x) - 1)
  
      if (x(j) <=xEval(i) && xEval(i) <= x(j +1))
    
        yEval(i) = m(j) * xEval(i) + b(j); # xEval in die interpolierrenden Geradengleichungen einsetzen
       
      end
  
    end
  end

end