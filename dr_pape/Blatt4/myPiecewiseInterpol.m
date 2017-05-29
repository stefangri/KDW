function [yEval]=myPiecewiseInterpol(x,f,xEval)
    
  for i = 1:(length(x) - 1)
   
    # Steigung der Geradegl. berechnen:
    m(i) = (f(i) - f(i + 1)) / (x(i) - x(i + 1));
    # y-Achsenabschnitt der Geradegl. berechnen:
    b(i) = (x(i) * f(i + 1) - x(i + 1) * f(i)) / (x(i) - x(i + 1));
  
  end
  
  for i = 1:(length(xEval))
    for j = 1:(length(x) - 1)
      
      # sicherstellen, dass xEval im richtigen Intervall liegt
      if (x(j) <=xEval(i) && xEval(i) <= x(j +1))
        
        # xEval in die interpolierrenden Geradengleichungen einsetzen
        yEval(i) = m(j) * xEval(i) + b(j);
       
      end
  
    end
  end

end